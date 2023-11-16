import pandas as pd

df = pd.read_csv("nextclade.csv", sep=';')

#Substituicoes
contagem_total = df['Nextclade_pango'].value_counts()

resultado_df = pd.DataFrame(columns=['Variante', 'Substituicao', 'Porcentagem'])

for valor in df['Nextclade_pango'].unique():
    df_filtrado = df[df['Nextclade_pango'] == valor]
    contagem_mutacoes = df_filtrado['aaSubstitutions'].str.split(',').explode().str.strip().value_counts()
    porcentagem_mutacoes = contagem_mutacoes / contagem_total[valor]
    temp_df = pd.DataFrame({'Variante': [valor] * len(contagem_mutacoes.index),
                            'Mutacao': contagem_mutacoes.index,
                            'Porcentagem': porcentagem_mutacoes})
    
    resultado_df = pd.concat([resultado_df, temp_df], ignore_index=True)


resultado_df.to_csv('substituicoes.csv', index=False)

#Delecoes
contagem_total = df['Nextclade_pango'].value_counts()

resultado_df = pd.DataFrame(columns=['Variante', 'Delecao', 'Porcentagem'])

for valor in df['Nextclade_pango'].unique():
    df_filtrado = df[df['Nextclade_pango'] == valor]
    contagem_mutacoes = df_filtrado['deletions'].str.split(',').explode().str.strip().value_counts()
    porcentagem_mutacoes = contagem_mutacoes / contagem_total[valor]
    temp_df = pd.DataFrame({'Variante': [valor] * len(contagem_mutacoes.index),
                            'Delecao': contagem_mutacoes.index,
                            'Porcentagem': porcentagem_mutacoes})
    
    resultado_df = pd.concat([resultado_df, temp_df], ignore_index=True)


resultado_df.to_csv('delecoes.csv', index=False)
