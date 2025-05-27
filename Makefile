NAME = inception
SRCS_DIR = srcs

all: $(NAME)

$(NAME):
	@docker-compose -f $(SRCS_DIR)/docker-compose.yml up --build

clean:
	@docker-compose -f $(SRCS_DIR)/docker-compose.yml down

fclean: clean
	@docker system prune -af
	@docker volume rm mariadb_data wordpress_data || true
	@rm -rf $(SRCS_DIR)/requirements/mariadb/data/*

re: fclean all

.PHONY: all clean fclean re 