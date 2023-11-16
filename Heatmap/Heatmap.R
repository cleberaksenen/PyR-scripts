library(ggplot2)

#Grafico - Heatmap
dados <- read.csv("delecoes.csv", sep=";")

# Ordem customizada
ordem <- c("ORF1a:509-520",
           "ORF1a:509-523",
           "ORF1a:515-520",
           "ORF1a:518-520",
           "ORF1a:686-694",
           "ORF1a:11288-11296",
           "S:21633-21641",
           "S:21765-21770",
           "S:21992-21994",
           "ORF7a:27509-27748",
           "N:28362-28370",
           "29734-29759")

dados$Delecao <- factor(dados$Delecao, levels = ordem)

#Gráfico - heatmap
grafico <- ggplot(dados, aes(x = Delecao, y = Variante, fill = Porcentagem)) +
  geom_tile(color = "black", size = 1) +
  scale_fill_gradient(low = "#e86af0", high = "#493267") +
  geom_text(aes(label = Porcentagem), color = "white", size = 5) +
  theme_minimal() +
  theme(panel.border = element_rect(color = "black", fill = NA, size = 1),
        axis.text = element_text(face = "bold", size = 10),
        axis.title = element_text(face = "bold", size = 14),
        legend.title = element_text(size = 16, face = "bold"),
        legend.text = element_text(size = 10, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1)) +  
  xlab("Deleções") +  
  ylab("Linhagens") +
  labs(fill = "")
  #guides(fill = FALSE)

ggsave("heatmap.jpg", plot = grafico, width = 16, height = 4, dpi = 1200)