/*                                                                                                                                                                                      
** Made by ner0                                                                                                                                          
**                                                                                            
** Started on  Thu Feb 16 23:48:12 2017 thomas                                                
** Last update Sat Feb 25 14:03:03 2017 thomas                                                
*/

#ifndef _OBJDUMP_H_
#define _OBJDUMP_H_

#include <elf.h>
#include <string.h>
#include <fcntl.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <sys/mman.h>
#include <errno.h>
#include <ctype.h>


/*      format32.c        */
void format32(void *data, char *filename);

/*      format64.c        */

void format64(void *data, char *filename);

/*      print_help.c      */

void    print_help();
void    print_help2();

/*      check_error.c             */

int check_access(char *filename);
int check_open(char *filename);
void *check_mmap(int fd, char * filename, unsigned int size);

#endif /* !_OBJDUMP_H_ */
