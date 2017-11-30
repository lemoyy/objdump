/*                                                                                                                                                                                       
** Made by ner0                                                                                                                                                                        
** Started on  Thu Feb 16 23:46:17 2017 thomas                                                
** Last update Sat Feb 25 15:57:02 2017 thomas                                                
*/

#include "objdump.h"

static void my_objdump(char *filename)
{
  void *data;
  Elf32_Ehdr *elf;
  int  fd;
  long size;

  if (check_access(filename) == -1)
    return ;
  if ((fd = check_open(filename)) == -1)
    return ;
  if ((size = lseek(fd, 0, SEEK_END)) == -1)
    {
      fprintf(stderr, "error: lseek: %s\n", strerror(errno));
      return ;
    }
  if ((data = check_mmap(fd, filename, size)) == MAP_FAILED)
    return ;
  elf = (Elf32_Ehdr*)data;
  if (elf->e_ident[EI_CLASS] == ELFCLASS32)
    format32(data, filename);
  else if (elf->e_ident[EI_CLASS] == ELFCLASS64)
    format64(data, filename);
  if (close(fd) == -1)
    fprintf(stderr, "error: munmap: %s\n", strerror(errno));
  if (munmap(data, size) == -1)
    fprintf(stderr, "error: munmap: %s\n", strerror(errno));
}

int     main(int ac, char **av)
{
  int i;

  if (ac > 1)
    {
      i = 0;
      while (++i < ac)
        my_objdump(av[i]);
    }
  else
  my_objdump("./a.out");
  return (0);
}
