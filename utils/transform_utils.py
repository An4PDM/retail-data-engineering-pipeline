import pandas as pd

def clean_strings (df: pd.DataFrame) -> pd.DataFrame:
    str_cols = df.select_dtypes(include="object").columns

    for col in str_cols:
        df[col] = df.str.strip()

    return df

def drop_duplicates(df: pd.DataFrame) -> pd.DataFrame:
    return df.drop_duplicates()

