# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: cbarbier <cbarbier@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2016/11/04 11:00:31 by fmaury            #+#    #+#              #
#    Updated: 2019/03/29 10:54:54 by cbarbier         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COMPILER		= go build

all : Colleen Grace Sully
Colleen: Colleen.go
	$(COMPILER) $<
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

Grace: Grace.go
	$(COMPILER) $<
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

Sully: Sully.go
	$(COMPILER) $<
	@echo "$@ built\t\t\033[0;32m✓\033[0m"

clean:
	rm -rf `ls | grep .dSYM`

fclean: clean
	rm -rf Colleen Grace Sully Grace_kid.go
	rm -rf `ls | grep Sully_`

re: fclean all

.PHONY: all clean fclean re
