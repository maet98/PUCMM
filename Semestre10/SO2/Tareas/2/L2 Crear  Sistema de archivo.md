## L2 Crear  Sistema de archivo



## Miguel Estevez

## 2017-0200



**Nota:** la libreria ext2_fs.h la buscamos por intenet y ponerla como relativo ya que no se encontraba en mi sistema.

### fs2.c

Corrida con mi particion de linux: **/dev/sda1**, donde podemos ver el tamaño de los bloques y el numeros de estos.

![image-20201014174038350](/home/miguelarch/.config/Typora/typora-user-images/image-20201014174038350.png)



#### opengroup.c

En este archivo se tenia que implementar esta funcion:

```c
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
```



<center>Corrida</center>

![image-20201014172057995](/home/miguelarch/.config/Typora/typora-user-images/image-20201014172057995.png)





### openuser.c

En este archivo se tenia que implementar esta funcion:

```c
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
```



<center><strong>Corrida</strong></center>

![image-20201014172120174](/home/miguelarch/.config/Typora/typora-user-images/image-20201014172120174.png)

