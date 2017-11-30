##
## Makefile for make in /home/noi7/Lab/sysunix/PSU_2016_nmobjdump
## 
## Made by thomas
## Login   <noi7@epitech.net>
## 
## Started on  Sat Feb 25 13:17:25 2017 thomas
## Last update Sat Feb 25 15:27:52 2017 thomas
##

CC	:=	gcc

RM	:=	rm -f

CFLAGS	:=	-W -Wextra -Wall -Werror -ansi -pedantic
CFLAGS	+=	-I./inc/.

NAME_1	:=	my_nm
NAME_2	:=	my_objdump

SRC_1_DIR	:=	src_nm
OBJ_1_DIR	:=	obj_nm
SRC_2_DIR	:=	src_objdump
OBJ_2_DIR	:=	obj_objdump
INC_DIR		:=	inc

SRC_1	:= 	main.c

SRC_1	:=	$(addprefix $(SRC_1_DIR)/, $(SRC_1))
SRC_2	:=	main.c \
		format32.c \
		check_error.c \
		format64.c \
		print_help.c

SRC_2	:=	$(addprefix $(SRC_2_DIR)/, $(SRC_2))

OBJ_1	:=	$(SRC_1:.c=.o)
OBJ_1	:=	$(patsubst $(SRC_1_DIR)/%.c, $(OBJ_1_DIR)/%.o, $(SRC_1))
OBJ_2	:=	$(SRC_2:.c=.o)
OBJ_2	:=	$(patsubst $(SRC_2_DIR)/%.c, $(OBJ_2_DIR)/%.o, $(SRC_2))

$(OBJ_1_DIR)/%.o:	$(SRC_1_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(OBJ_2_DIR)/%.o:	$(SRC_2_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

all:		$(NAME_1) $(NAME_2)

nm:		$(NAME_1)

$(NAME_1):	$(OBJ_1)
		$(CC) $(OBJ_1) -o $(NAME_1)

objdump:	$(NAME_2)

$(NAME_2):	$(OBJ_2)
		$(CC) $(OBJ_2) -o $(NAME_2)

clean:
		$(RM) $(OBJ_1) $(OBJ_2)
		$(RM) ./src_nm/*~ ./src_nm/#*# ./obj_nm/*~ ./obj_nm/#*#
		$(RM) ./src_objdump/*~ ./src_objdump/#*# ./obj_objdump/*~ ./obj_objdump/#*#
		$(RM) ./inc/*~ ./inc/#*#
		$(RM) *~ #*#

fclean:		clean
		$(RM) $(NAME_1) $(NAME_2)

re:		fclean all

.PHONY:		all clean fclean re
