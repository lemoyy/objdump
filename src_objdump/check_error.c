/*
** xfonc.c for fa in /home/noi7/Lab/test/objdump
** 
** Made by thomas
** Login   <noi7@epitech.net>
** 
** Started on  Thu Feb 16 23:49:03 2017 thomas
** Last update Sat Feb 25 16:25:47 2017 thomas
*/
#include "objdump.h"

int check_access(char *filename)
{
  if (access(filename, F_OK) == -1)
    {
      printf("nm: '%s': No such file\n", filename);
      return (-1);
    }
  return (0);
}

int check_open(char *filename)
{
  int fd;

  if ((fd = open(filename, O_RDONLY, 0)) == -1)
    {
      fprintf(stderr, "nm: %s: File format not recognized\n", filename);
      return (-1);
    }
  return (fd);
}

void *check_mmap(int fd, char * filename, unsigned int size)
{
  void *data;

  if ((data = mmap(NULL, size,
		   PROT_READ, MAP_SHARED, fd, 0)) == MAP_FAILED)
    {
      close(fd);
      fprintf(stderr, "nm: Warning: '%s' is not an ordinary file\n", filename);
      return (MAP_FAILED);
    }
  return (data);
}
