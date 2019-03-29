# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbarbier <cbarbier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/04 11:00:31 by fmaury            #+#    #+#              #
#    Updated: 2019/03/29 10:54:35 by cbarbier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPILER		= gcc

CC_FLAGS		= -Wall -Werror -Wextra

all : Colleen Grace Sully

Colleen: Colleen.c
	$(COMPILER) $(CC_FLAGS) $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

Grace: Grace.c
	$(COMPILER) $(CC_FLAGS) $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

Sully: Sully.c
	$(COMPILER) $(CC_FLAGS) $< -o $@
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

clean:
	rm -rf `ls | grep .dSYM`

fclean: clean
	rm -rf Colleen Grace Sully Grace_kid.c
	rm -rf `ls | grep Sully_`

re: fclean all

.PHONY: all clean fclean re
