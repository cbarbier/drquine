# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbarbier <cbarbier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/04 11:00:31 by fmaury            #+#    #+#              #
#    Updated: 2019/03/21 15:35:34 by cbarbier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPILER		= gcc

CC_FLAGS		= -Wall -Werror -Wextra

all : Colleen Grace Sully

Colleen: Colleen.c
	$(COMPILER) $(CC_FLAGS) $< -o $@
	@echo "Colleen built $@\t\t\033[0;32m✓\033[0m"

Grace: Grace.c
	$(COMPILER) $(CC_FLAGS) $< -o $@
	@echo "Grace built $@\t\t\033[0;32m✓\033[0m"

Sully: Sully.c
	$(COMPILER) $(CC_FLAGS) $< -o $@
	@echo "Sully built $@\t\t\033[0;32m✓\033[0m"

clean:
	rm -rf Colleen Grace Sully

fclean: clean

re: fclean all

.PHONY: all clean fclean re
