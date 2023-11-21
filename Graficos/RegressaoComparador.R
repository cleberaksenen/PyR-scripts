library(ggplot2)


dados <- read.csv("dados.csv", sep=";")
dados$data <- format(dados$data, format = "%Y-%m")



grafico <- ggplot(data = subgrupo, aes(x = data, y = valor, group = id)) +
  geom_line(size = 1.5, alpha = 0.5, color = "#c30101") +
  geom_point(color = "#c30101") +
  labs(x = "EixoX", y = "EixoY", title = "Titulo") +
  scale_color_manual(values = "#c30101") +
  theme_minimal() +
  theme(panel.border = element_rect(color = "black", fill = NA, size = 1),
        axis.text = element_text(face = "bold", size = 12),
        axis.title = element_text(face = "bold", size = 14),
        legend.title = element_text(size = 16, face = "bold"),
        legend.text = element_text(size = 10, face = "bold"),
        legend.position = "none",
        axis.text.x = element_text(size = 10)) +
  guides(color = FALSE)

ggsave("grafico.jpg", plot = grafico, width = 16, height = 4, dpi = 300)


