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
 * Please IMPLEMENT THIS! This function will print out a portion of the
 * superblock to the console. It is called in main after reading in the super
 * block from the disk.
 */
void print_super_block(struct ext2_super_block* super);

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
  print_super_block(&usb_block);

  return 0;
}

/*
 * Implement this method!
 */
void print_super_block(struct ext2_super_block* super){

    printf("inodes count\t: %d\n", super->s_inodes_count);
    printf("block count\t: %d\n", super->s_blocks_count);
    printf("free blocks count\t: %d\n", super->s_free_blocks_count);
    printf("free inodes count\t: %d\n", super->s_free_inodes_count);
    printf("first data block\t: %d\n", super->s_first_data_block);
    printf("block size\t: %d\n", super->s_log_block_size);
    printf("blocks per group\t: %d\n", super->s_blocks_per_group);
    printf("inodes per group\t: %d\n", super->s_inodes_per_group);
    printf("size of the inode structure\t: %d\n", super->s_inode_size);
  /*
   * Print out the inodes count, blocks count, free blocks count, free inodes 
   * count, the first data block, block size, blocks per group, inodes per 
   * group, and the size of the inode structure. The output should be 
   * "<field>\t:<value>\n".
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

  /* closing the USB device */
  close(fd);

  return fd;
}
