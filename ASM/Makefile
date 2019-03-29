# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbarbier <cbarbier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/04 11:00:31 by fmaury            #+#    #+#              #
#    Updated: 2019/03/29 10:54:08 by cbarbier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NASM		= /Users/cbarbier/.brew/Cellar/nasm/2.14.02/bin/nasm
NASM		= nasm

FLAGS		= -f macho64

LOADER		= ld -macosx_version_min 10.8 -lSystem

all : Colleen Grace Sully

%.o : %.s
	$(NASM) $(FLAGS) $< -o $@ 

Colleen: Colleen.o
	$(LOADER) $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

Grace: Grace.o
	$(LOADER) $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

Sully: Sully.o
	$(LOADER) $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

clean:
	rm -rf  `ls | grep "\.o"`

fclean: clean
	rm -rf Colleen Grace Sully Grace_kid.s
	rm -rf `ls | grep Sully_`
	rm -rf `ls | grep .dSYM`

re: fclean all

.PHONY: all clean fclean re
