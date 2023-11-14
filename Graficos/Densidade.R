library(ggplot2)


dados <- read.csv("dados.csv", sep=";")
dados$data_coleta <- as.Date(dados$data_coleta)

dados$variante <- factor(dados$variante, levels = c(
  "OUTRAS",
  "VOI_ZETA_P.2-LIKE",
  "VOC_GAMA_P.1-LIKE",
  "VOC_DELTA_B.1.617.2-LIKE",
  "VOC_OMICRON_BA.1-LIKE",
  "VOC_OMICRON_BA.2-LIKE",
  "VOC_OMICRON_BA.4-LIKE",
  "VOC_OMICRON_BA.5-LIKE",
  "VOC_OMICRON_BQ.1-LIKE",
  "VOC_OMICRON_BE.9-LIKE",
  "VOC_OMICRON_RECOMBINANTE"
))


grafico <- ggplot(data=dados, aes(x=data_coleta, group=variante, fill=variante)) +
  geom_density(adjust=1.5, position="fill") +
  scale_x_date(date_labels = "%b %Y",
               date_breaks = "1 month",  # Quebra de data principal
               date_minor_breaks = "1 month",  # Quebra de data secundária
               limits = c(start_date, end_date)) +  # Define o limite do intervalo
  scale_fill_manual(values = c("#EAEAEA", "#D41243", "#0086AD",
                               "#006565FE", "#D896FF", "#BE29ECFE",
                               "#650065", "#4F5BD6FE", "#D62976FE",
                               "#F97D1EFE", "#4f372d")) +
  theme(panel.border = element_rect(color = "black", fill = NA, size = 1),
        axis.text = element_text(face = "bold", size = 10),
        axis.title = element_text(face = "bold", size = 14),
        legend.title = element_text(size = 16, face = "bold"),
        legend.text = element_text(size = 10, face = "bold"),
        axis.text.x = element_text(angle = 45, hjust = 1),
        panel.spacing = unit(0, "lines")) +  
  xlab("eixoX") +  
  ylab("eixoY") +
  labs(fill = "Legenda:") +
  guides(fill = FALSE)

ggsave("Grafico.jpg", plot = grafico, width = 16, height = 4, dpi = 1200)

