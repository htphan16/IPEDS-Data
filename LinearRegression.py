
# coding: utf-8

# In[135]:


from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt
import seaborn as sns
import pandas as pd

data = pd.read_csv('2013_data.csv')


# In[1]:


#data.isnull().values.any()   
#data.isnull().sum()


# In[137]:


df = pd.DataFrame(data=data.corrwith(data['RET_PCF']))
df = df.rename(columns={0: "Full time retention rate"})
df.drop(['Unnamed: 0', 'RET_PCF'], inplace=True)


# In[138]:


df[df['Full time retention rate']>0.4]


# In[139]:


columns = ['GIS4A12', 'F1D01', 'F1D02', 'F1A01', 'F1A10', 'BAGR100', 'BAGR150']


# In[151]:


new_df = pd.DataFrame(data[columns])
new_df.rename(columns = {'GIS4A12': 'Average amount of grant and scholarship aid awarded, income level (0-30,000), 2015-16', 
               'F1D01': 'Total all revenues and other additions', 
               'F1D02': 'Total expenses and other deductions',
               'F1A01': 'Total current assets', 
               'F1A10': 'Long term debt', 
               'BAGR100': '4-year Graduation rate - bachelors degree within 100% of normal time', 
               'BAGR150': '6-year Graduation rate - bachelors degree within 150% of normal time'}, inplace=True)


# In[152]:


#new_df


# In[153]:


new_df.fillna(0, inplace=True)
data['RET_PCF'].fillna(0, inplace=True)


# In[154]:


train_X, test_X, train_y, test_y = train_test_split(new_df, data['RET_PCF'], test_size = 0.2)

model = LinearRegression()   

model.fit(train_X, train_y)


# In[155]:


from sklearn.model_selection import cross_val_score

linear_scores = cross_val_score(model, new_df, data['RET_PCF'], cv= 5)
print(linear_scores.mean())

