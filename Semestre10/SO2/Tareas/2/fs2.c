#include<stdio.h>
#include<unistd.h>
#include<stdlib.h>
#include<linux/fs.h>
#include "ext2_fs.h"
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>

#define BASE_OFFSET 1024
#define USB_DEVICE "/dev/sda1"

int block_size;

int print_super(int fd,struct ext2_super_block * super){

    off_t scount;
    char * s;
    int rcount;
    int block_offset;


    if((scount = lseek(fd,BASE_OFFSET,SEEK_SET))!= BASE_OFFSET)
     printf("scount is %d seek failure!\n",(int)scount);

    rcount = read(fd,super,sizeof(struct ext2_super_block));
    printf("read %d bytes.\n",rcount);

    s = (super->s_magic == EXT2_SUPER_MAGIC)? "This is ext2.\n" : "This is not ext2 system.\n";
    printf("%s",s);
    printf("magic is:%d \n",super->s_inodes_count);

    block_size = 1024 << super->s_log_block_size;
    printf("block size is %d\n",block_size);
}

int print_gdt(int fd, struct ext2_group_desc *gdt){
	
	int scount,rcount;
	scount = lseek(fd,block_size,SEEK_SET);
//	printf("scount is %d seek gdt failure!\n",scount);
	rcount = read(fd,gdt,sizeof(struct ext2_group_desc));
	printf("bitmap block is %d\n",gdt->bg_block_bitmap);

}

int print_bitmap(int fd,int block_bitmap){
	int block_offset;
	int i;
	unsigned char bitmap[block_size];
	block_offset = (block_bitmap ) * block_size;
	lseek(fd,block_offset,SEEK_SET);
	read(fd,bitmap,block_size);
	for (i =0; i<=80;i++) printf("%x", bitmap[i]);printf("\n");

}



int print_inode(int fd, int table, int size,struct ext2_inode *inode){
	
	lseek(fd,block_size*table+size,SEEK_SET);
	read(fd,inode,size);
	printf("mode is %x\n",inode->i_mode);
	printf("%5x %5x %5x\n",inode->i_atime,inode->i_mtime,inode->i_dtime);
	printf("block number is: %d\n",inode->i_blocks);
	printf("1st block is: %d\n",inode->i_block[0]);
}

int print_directory(int fd, int first,int block_size){
	
	int i,scount;
	struct ext2_dir_entry_2 dir;
	scount = lseek(fd,block_size*first,SEEK_SET);
	read(fd,&dir,sizeof(struct ext2_dir_entry_2));
	printf("%d\n",dir.inode);
	printf("%d\n",dir.file_type);	
	printf("%d\n",dir.name_len);
	//for(i=0;i<dir.name_len;i++)
	//printf("%s",dir.charname[i]);
	printf("%s\n",dir.name);
	printf("\n");
}

int main(){

	struct ext2_super_block super;
	struct ext2_group_desc gdt;
	struct ext2_inode *inode;
	int i;
	int fd;
	int block_size;
	int block_offset;
	int block_bitmap;
	int inode_size;
	int inode_table;
	int first_block;
	unsigned char bitmap[4096];

	if((fd = open(USB_DEVICE,O_RDONLY)) < 0)
	printf("file open failure!\n");

	print_super(fd,&super);
	print_gdt(fd,&gdt);
	block_size = 1024<<super.s_log_block_size;
	
	block_bitmap = (int)gdt.bg_block_bitmap;
	printf("bitmap is %d\n",block_bitmap);
	print_bitmap(fd,block_bitmap);

//	printf("inode is %d\n",super.s_inode_size);
	inode_size = super.s_inode_size;
	inode_table = gdt.bg_inode_table;
	
	inode = (struct ext2_inode *)malloc(inode_size)  ;
	print_inode(fd,inode_table,inode_size,inode);

	first_block = inode->i_block[0];
	print_directory(fd,first_block,block_size);	
	printf("dir size is %d\n",sizeof(struct ext2_dir_entry_2));
}
