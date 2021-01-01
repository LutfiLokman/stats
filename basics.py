import pandas as pd
import numpy as np

df = pd.read_csv('https://raw.githubusercontent.com/narxiss24/datasets/master/titanic_train.csv')

# Describe and info

df.info()

df.describe()

# Check if each element in the column 'Fare' is float
df_type = df['Fare'].apply(lambda x: isinstance(x, float))

# Select columns

df_col = df[['PassengerId', 'Pclass', 'Survived']]  # Note the double square brackets

# Drop columns

df_dp = df.copy()
df_dp.drop('Embarked', axis=1, inplace=True)  # Axis 0 is rows, axis 1 is column

# Select first 5 rows

df_row = df.loc[0:4]

# Select rows based on condition

df_rowcond = df[df['Pclass'] > 1]

# OR

df_rowcond2 = df.loc[df['Pclass'] > 1]

# OR

df_rowcond3 = df.query('Pclass > 1')
df.query
# Rename row items based on condition

df_rename = df.copy()
df_rename['Survived'] = df['Survived'].apply(lambda x: 'Died' if x == 0 else 'Survived')

# OR

df.loc[df['Survived'] == 0, 'Survived'] = 'Died'
df.loc[df['Survived'] == 1, 'Survived'] = 'Survived'

# Group by Pclass, get count

df_gp = df.groupby('Survived').size()

# Group by Pclass, get count and mean of Fares

df_gp1 = df.groupby('Pclass')['Fare'].agg(['sum', 'mean'])

# Group by Pclass, subgroup by Sex, get sum of subgroup Fares

df_gp2 = df.groupby(['Pclass', 'Sex'], as_index=False)['Fare'].agg('sum')  # 'as_index=False' == 'reset_index()'

# Group by Pclass, subgroup by Sex, get only subgroup with highest sum of Fare

#  ---------------------------------------
#  Pclass | Sex     |  Sum of Fare
#  ---------------------------------------
#  1      | female  |  9975.82 <- Select
#         | male    |  8201.58
#  ---------------------------------------
#  2      | female  |  1669.72
#         | male    |  2132.11 <- Select
#  ---------------------------------------
#  3      | female  |  2321.10
#         | male    |  4393.58 <- Select
#  ---------------------------------------

dfp = df.groupby(['Pclass', 'Sex'], as_index=False)['Fare'].agg('sum')

dfp = dfp[dfp.groupby(['Pclass'])['Fare'].transform(max) == dfp['Fare']]  # the transform() function transforms all
# elements in the column

# Group by Pclass, apply different functions to different columns

df_gp4 = df.groupby('Pclass').agg(
    {
        'Fare': 'sum',
        'Age': 'mean',
        'Name': lambda x: ','.join(x)
    }
).reset_index()

# Using named aggregation

df_gp5 = (df
        .groupby("Pclass")
        .agg(
            min_age=('Age', 'min'),
            max_fare=('Fare', 'max'),
            average_fare=('Fare', np.mean)
            ))

# Group by Pclass, apply same built-in functions to different columns

df_gp6 = df.groupby('Pclass')[['Fare', 'Age']].sum().reset_index()

# Group by Pclass, apply same custom functions to different columns

df_gp7 = df.groupby('Pclass').agg(
    {
        i: lambda x: ', '.join(x) for i in ['Ticket', 'Name']
    }
).reset_index()

# Get dummy variables

df_dummy = df.copy()
df_dummy = pd.get_dummies(df_dummy, columns=['Pclass', 'Sex'], drop_first=True, prefix_sep='-')
