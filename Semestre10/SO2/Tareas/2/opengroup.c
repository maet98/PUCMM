#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include "ext2_fs.h"

#define BASE_OFFSET 1024
#define USB_DEVICE "/dev/sda1"
#define BLOCK_OFFSET(block) (BASE_OFFSET + (block - 1) * block_size)
#define FILTER_BIT(byte, i) ((byte >> i) & 0x01)

static unsigned int block_size = 0;

/*
 * Please IMPLEMENT THIS: this function will print out a portion of the group
 * descriptor pointed to by group to the console. This function is called in
 * open_usb with the first group descriptor.
 */
void print_group_desc(struct ext2_group_desc* group);

/* 
 * The actual function to open and read raw bytes off the USB stick.
 * Takes a pointer to a superblock structure, fills it with the bytes
 * from the USB drive and returns the file descriptor (which is actually
 * just an int)
 */
int open_usb(struct ext2_super_block* super);



int main(void){
  struct ext2_super_block usb_block;
  int file_descriptor;

  file_descriptor = open_usb(&usb_block);

  return 0;
}

/*
 * Implement this function.
 */
void print_group_desc(struct ext2_group_desc* group){
    printf("blocks bitmap block\t: %d\n",group->bg_block_bitmap);
    printf("inodes bitmap block\t: %d\n",group->bg_inode_bitmap);
    printf("inodes table block\t: %d\n",group->bg_inode_table);
    printf("free blocks count\t: %d\n",group->bg_free_blocks_count);
    printf("free inodes count\t: %d\n",group->bg_free_inodes_count);
    printf("directories count\t: %d\n",group->bg_used_dirs_count);
  /*
   * Print out: blocks bitmap block, inodes bitmap block, inodes table block,
   * free blocks count, free inodes count, and the directories count. Your
   * output should be "<field>\t:<value>\n".
   */
}

int open_usb(struct ext2_super_block* super){
  int fd;
  struct ext2_group_desc* group = malloc(sizeof(struct ext2_group_desc));

  /* open USB device */
  fd = open(USB_DEVICE, O_RDONLY); //opening the device for reading
  if(fd < 0){ //some kind of error occurred
    perror(USB_DEVICE);
    exit(1); //we give up at this point
  }

  /* Now we read in Mr. Superblock */
  /* seeking across the 'disk' to the superblock location */
  lseek(fd, BASE_OFFSET, SEEK_SET);
  /*actually reading in the bytes */
  read(fd, super, sizeof(struct ext2_super_block));

  /* Some sanity checks */
  /* Make sure we're reading an EXT2 filesystem */
  if(super->s_magic != EXT2_SUPER_MAGIC){
    fprintf(stderr, "Not an Ext2 filesystem!\n");
    exit(1);
  }

  block_size = 1024 << super->s_log_block_size;

  /*Now on to reading the group descriptors */
  int num_groups = 
	(super->s_blocks_count + super->s_blocks_per_group - 1) /
		super->s_blocks_per_group;

  /* seek to the first descriptor */
  lseek(fd, 
	BASE_OFFSET + block_size, 
	SEEK_SET);
  /* read it in */
  read(fd, group, sizeof(struct ext2_group_desc));
  /* print it! */
  print_group_desc(group);

  /* closing the USB device */
  close(fd);

  return fd;
}
