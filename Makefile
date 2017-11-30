##
## Made by ner0
## Started on  Sat Feb 25 13:17:25 2017
## Last update Sat Feb 25 15:27:52 2017
##

CC	:=	gcc

RM	:=	rm -f

CFLAGS	:=	-W -Wextra -Wall -Werror -ansi -pedantic
CFLAGS	+=	-I./inc/.

NAME_2	:=	my_objdump

SRC_2_DIR	:=	src_objdump
OBJ_2_DIR	:=	obj_objdump
INC_DIR		:=	inc

SRC_2	:=	main.c \
		format32.c \
		check_error.c \
		format64.c

SRC_2	:=	$(addprefix $(SRC_2_DIR)/, $(SRC_2))

OBJ_2	:=	$(SRC_2:.c=.o)
OBJ_2	:=	$(patsubst $(SRC_2_DIR)/%.c, $(OBJ_2_DIR)/%.o, $(SRC_2))

$(OBJ_2_DIR)/%.o:	$(SRC_2_DIR)/%.c
	$(CC) $(CFLAGS) -c -o $@ $<

all:		$(NAME_2)

objdump:	$(NAME_2)

$(NAME_2):	$(OBJ_2)
		$(CC) $(OBJ_2) -o $(NAME_2)

clean:
		$(RM) $(OBJ_2)
		$(RM) ./src_objdump/*~ ./src_objdump/#*# ./obj_objdump/*~ ./obj_objdump/#*#
		$(RM) ./inc/*~ ./inc/#*#
		$(RM) *~ #*#

fclean:		clean
		$(RM) $(NAME_2)

re:		fclean all

.PHONY:		all clean fclean re
