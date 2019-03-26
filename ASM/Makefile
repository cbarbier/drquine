# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbarbier <cbarbier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/04 11:00:31 by fmaury            #+#    #+#              #
#    Updated: 2019/03/26 14:57:06 by cbarbier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPILER		= /Users/cbarbier/.brew/Cellar/nasm/2.14.02/bin/nasm

FLAGS			= -f macho64

all : Colleen Grace Sully

%.o : %.s
	$(COMPILER) $(FLAGS) $< -o $@ 

Colleen: Colleen.o
	ld $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

Grace: Grace.o
	ld $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

Sully: Sully.o
	ld $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

clean:
	rm -rf  `ls | grep "\.o"`

fclean: clean
	rm -rf Colleen Grace Sully Grace_kid.s
	rm -rf `ls | grep Sully_`
	rm -rf `ls | grep .dSYM`

re: fclean all

.PHONY: all clean fclean re
