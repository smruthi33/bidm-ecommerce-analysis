#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd


# In[2]:


orders = pd.read_csv("./orders.csv")
orders.head()


# In[3]:


products=pd.read_csv("./products.csv")
products.head()


# In[4]:


aisle = pd.read_csv("./aisles.csv")
dept=pd.read_csv("./departments.csv")


# In[8]:


prod_final=products.merge(aisle, on="aisle_id")


# In[11]:


del prod_final["aisle_id"]


# In[12]:


prod_final=prod_final.merge(dept, on="department_id")
del prod_final["department_id"]
prod_final.head()


# In[17]:


orders=orders.loc[orders["eval_set"]!="test"]


# In[18]:


order_prior=pd.read_csv("order_products__prior.csv")
order_train=pd.read_csv("order_products__train.csv")


# In[19]:


orders


# In[21]:


order_prior


# In[23]:


order_main_prior=orders.loc[orders["eval_set"]=="prior"]
order_main_prior


# In[30]:


order_final_1=order_main_prior.merge(order_prior, on="order_id")
order_final_1.head()


# In[33]:


order_final_1


# In[25]:


order_main_train=orders.loc[orders["eval_set"]=="train"]
order_main_train


# In[31]:


order_final_2=order_main_train.merge(order_train, on="order_id")
order_final_2.head()


# In[32]:


order_final_2


# In[40]:


order_list=order_final_1.append(order_final_2)


# In[41]:


order_list=order_list.merge(prod_final, on="product_id")


# In[42]:


del order_list["product_id"]


# In[43]:


order_list


# In[44]:


order_list.to_csv("./train_dataset.csv")


# In[ ]:




