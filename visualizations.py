import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Load the COVID-19 deaths data from the Excel file
file_path = "covid_deaths.xlsx"  
df = pd.read_excel(file_path)

# Preview the DataFrame
print(df.head())

# Ensure the relevant columns exist in the DataFrame
required_columns = [
    "location", "total_cases", "total_deaths", "total_cases_per_million",
    "total_deaths_per_million", "total_vaccinations_per_hundred"
]
missing_columns = [col for col in required_columns if col not in df.columns]
if missing_columns:
    print(f"Missing columns: {missing_columns}")
else:
    # Calculate death percentage
    df["death_percentage"] = (df["total_deaths"] / df["total_cases"]) * 100

    # Heatmap: Death percentage by location
    plt.figure(figsize=(8, 6))
    heatmap_data = df.pivot_table(values="death_percentage", index="location", aggfunc="mean")
    sns.heatmap(heatmap_data, annot=True, cmap="coolwarm", cbar_kws={"label": "Death Percentage (%)"})
    plt.title("Heatmap of Death Percentage by Location")
    plt.ylabel("Location")
    plt.tight_layout()
    plt.show()

    # Bar Chart: Total vaccinations per hundred by location
    plt.figure(figsize=(10, 6))
    sns.barplot(data=df, x="location", y="total_vaccinations_per_hundred", palette="viridis")
    plt.title("Total Vaccinations per Hundred by Location")
    plt.xlabel("Location")
    plt.ylabel("Total Vaccinations per Hundred")
    plt.tight_layout()
    plt.show()

    # Bar Chart: Total cases and deaths per million by location
    plt.figure(figsize=(10, 6))
    df_melted = df.melt(
        id_vars="location",
        value_vars=["total_cases_per_million", "total_deaths_per_million"],
        var_name="Metric",
        value_name="Value",
    )
    sns.barplot(data=df_melted, x="location", y="Value", hue="Metric", palette="mako")
    plt.title("Total Cases and Deaths per Million by Location")
    plt.xlabel("Location")
    plt.ylabel("Per Million Metrics")
    plt.legend(title="Metric", labels=["Cases per Million", "Deaths per Million"])
    plt.tight_layout()
    plt.show()
