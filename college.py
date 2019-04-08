import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns; sns.set()

college2010 = pd.read_csv('2010_data.csv')
college2010 = college2010.convert_objects(convert_numeric=True)
college2011 = pd.read_csv('2011_data.csv')
college2011 = college2011.convert_objects(convert_numeric=True)
college2012 = pd.read_csv('2012_data.csv')
college2012 = college2012.convert_objects(convert_numeric=True)
college2013 = pd.read_csv('2013_data.csv')
college2013 = college2013.convert_objects(convert_numeric=True)
college2014 = pd.read_csv('2014_data.csv')
college2014 = college2014.convert_objects(convert_numeric=True)
college2015 = pd.read_csv('2015_data.csv')
college2015 = college2015.convert_objects(convert_numeric=True)
college2016 = pd.read_csv('2016_data.csv')
college2016 = college2016.convert_objects(convert_numeric=True)
college2017 = pd.read_csv('2017_data.csv')
college2017 = college2017.convert_objects(convert_numeric=True)

'''corr = college2010[["Total current assets","Long term debt","Student-to-faculty ratio", 'Revenues - Tuition and fees, after deducting discounts and allowances', 'Full-time retention rate']].corr()
sns.heatmap(corr, xticklabels=corr.columns, yticklabels=corr.columns, annot=True,cmap='summer')
plt.show()'''
'''from sklearn.preprocessing import StandardScaler
from sklearn.preprocessing import Imputer
imputer = Imputer(missing_values=np.nan, strategy='mean', axis=0)
x = college2010[['Total entering students at the undergraduate level, fall of current year','Total discounts and allowances', "Discounts and allowances applied to tuition and fees", 'Full-time retention rate', 'Long term debt', 'Total all revenues and other additions', "6-year Graduation rate - bachelor's degree within 150% of normal time"]]
x = imputer.fit_transform(x)
x = StandardScaler().fit_transform(x)
print(x)
#print(college2010.isnull().sum().to_csv('missing_values_2010.csv'))
print(college2017.isnull().sum().to_csv('missing_values_2017.csv'))
#print(college2016.isnull().sum().to_csv('missing_values_2016.csv'))
#x = college2011[['Average amount of student loans awarded to full-time first-time undergrad students','Average amount of grant and scholarship aid awarded, all income levels', 'Total current assets', "Student-to-faculty ratio", 'Revenues - Tuition and fees, after deducting discounts and allowances', 'Full-time retention rate', 'Long term debt']]

from sklearn.decomposition import PCA
pca = PCA(n_components=3)
principalComponents = pca.fit_transform(x)
principalDf = pd.DataFrame(data = principalComponents, columns = ['principal component 1', 'principal component 2', 'principal component 3'])
finalDf = pd.concat([principalDf, college2010['Sector of institution']], axis = 1)
print(pca.explained_variance_ratio_)
# Visualization
fig = plt.figure(figsize = (5,5))
ax = fig.add_subplot(1,1,1) 
ax.set_xlabel('Principal Component 1', fontsize = 15)
ax.set_ylabel('Principal Component 2', fontsize = 15)
ax.set_title('3 component PCA', fontsize = 20)
targets = [0,1,2,3,4]
colors = ['red', 'darkgreen', 'blue', 'yellow', 'orange']
for target, color in zip(targets,colors):
    indicesToKeep = finalDf['Sector of institution'] == target
    ax.scatter(finalDf.loc[indicesToKeep, 'principal component 3']
               , finalDf.loc[indicesToKeep, 'principal component 2']
               , c = color
               , s = 50)
ax.legend(targets)
ax.grid()
#plt.show()'''
#[college2010['Full-time retention rate'] != np.nan]



college2010_rt = college2010.dropna(subset=['Full-time retention rate'])
college2016_rt = college2016.dropna(subset=['Full-time retention rate'])

common = []
closed = ['Prince Institute-Southeast', 'Southeastern Bible College', 'Olympian Academy of Cosmetology', 'ITT Technical Institute-Tucson', 'ITT Technical Institute-Tempe', 'Tucson College', 'ITT Technical Institute-Rancho Cordova', 'Le Cordon Bleu College of Culinary Arts-San Francisco', 'ITT Technical Institute-National City', 'ITT Technical Institute-San Dimas', 'ITT Technical Institute-Orange', 'Oceanside College of Beauty', 
            'IBMC College', 'Ridley-Lowell Business & Technical Institute-New London', 'Everest University-Pompano Beach', 'ITT Technical Institute-Tampa', 'Jones College-Jacksonville', 'Lincoln College of Technology-West Palm Beach', 'Everest University-North Orlando', 'Darton State College', 'ITT Technical Institute-Boise', 'Le Cordon Bleu College of Culinary Arts-Chicago', 'Sanford-Brown College-Chicago', 'Hair Fashions By Kaye Beauty College-Noblesville', 
            'ITT Educational Services Inc-System Office', 'ITT Technical Institute-Nashville', 'ITT Technical Institute-Fort Wayne', 'ITT Technical Institute-Indianapolis', 'Purdue University-Calumet Campus', 'Purdue University-North Central Campus', 'Saint Josephs College', 'Brown Mackie College-Kansas City', 'Brown Mackie College-Salina', "L'Academie de Cuisine", 'Maryland Beauty Academy', 'Sojourner-Douglass College', 'Episcopal Divinity School', 'School of the Museum of Fine Arts at Tufts University', 
            'The New England Institute of Art', 'ITT Technical Institute-Wyoming', 'Paul Mitchell the School-Escanaba', 'Cosmetology Careers Unlimited College of Hair Skin and Nails', 'The Art Institutes International-Minnesota', 'Sanford-Brown College-Mendota Heights', 'ITT Technical Institute-Earth City', 'Everest College-Springfield', 'Bramson ORT College', 'Brittany Beauty Academy', 'LIU Hudson at Rockland', 'Ridley-Lowell Business & Technical Institute-Binghamton', 'Technical Career Institutes', 
            'Wood Tobe-Coburn School', 'Mercy School of Nursing', 'ITT Technical Institute-Dayton', 'Brown Mackie College-North Canton', 'Gallipolis Career College', 'Daymar College-New Boston', 'Brown Mackie College-Akron', 'Trumbull Business College', 'Western Hills School of Beauty and Hair Design', 'ITT Technical Institute-Youngstown', 'Academy of Hair Design-Salem', 'ITT Technical Institute-Portland', 'Springfield College of Beauty', 'Abington Memorial Hospital Dixon School of Nursing', 'Keystone Technical Institute', 
            'The Art Institutes of York-PA', 'Lutheran Theological Seminary at Philadelphia', 'Newport School of Hairdressing-Main Campus', 'ITT Technical Institute-Arlington', 'ITT Technical Institute-Houston West', 'ITT Technical Institute-Murray', 'Everest College-Newport News', 'ITT Technical Institute-Seattle', 'ITT Technical Institute-Spokane Valley', 'West Virginia Business College-Wheeling', 'Advanced Institute of Hair Design-Glendale', 'Gill-Tech Academy of Hair Design', 'ITT Technical Institute-Greenfield', 
            'ITT Technical Institute-Sylmar', 'ITT Technical Institute-Westminster', 'Antonelli Medical and Professional Institute', 'ITT Technical Institute-Newburgh', 'Consolidated School of Business-Lancaster', 'ITT Technical Institute-Troy', 'Le Cordon Bleu College of Culinary Arts-Scottsdale', 'Le Cordon Bleu College of Culinary Arts-Austin', 'The Art Institute of New York City', 'ITT Technical Institute-Norwood', 'ITT Technical Institute-Knoxville', 'ITT Technical Institute-Austin', 'ITT Technical Institute-Houston North', 
            'McNally Smith College of Music', 'ITT Technical Institute-Norfolk', 'ITT Technical Institute-Albuquerque', 'ITT Technical Institute-Lake Mary', 'Le Cordon Bleu College of Culinary Arts-Portland', 'ITT Technical Institute-San Antonio', 'ITT Technical Institute-Torrance', 'Seattle Vocational Institute', 'ITT Technical Institute-San Bernardino', 'Chicago ORT Technical Institute', 'Daymar College-Louisville', 'ITT Technical Institute-Jacksonville', 'ITT Technical Institute-Omaha', 'Career Training Academy-Monroeville', 
            'ITT Technical Institute-Fort Lauderdale', 'National Institute of Massotherapy', 'ITT Technical Institute-Little Rock', 'ITT Technical Institute-Oxnard', 'ITT Technical Institute-Louisville', 'ITT Technical Institute-Greenville', 'ITT Technical Institute-Cordova', 'Salon Academy', 'Phagans Newport Academy of Cosmetology Careers', 'ITT Technical Institute-Everett', 'ITT Technical Institute-Bessemer', 'ITT Technical Institute-Pittsburgh', 'Carsten Institute of Cosmetology', 'Everest University-Melbourne', 'ITT Technical Institute-Getzville', 
            'Sanford-Brown College-Atlanta', 'Le Cordon Bleu College of Culinary Arts-Pasadena', 'ITT Technical Institute-Webster', 'CET-Durham', 'Styles and Profiles Beauty College', 'ITT Technical Institute-Henderson', 'ITT Technical Institute-Hialeah', 'ITT Technical Institute-Harrisburg', 'ITT Technical Institute-Tarentum', 'ITT Technical Institute-Norwood', 'ITT Technical Institute-Strongsville', 'Everest Institute-Marietta', 'Dewey University-Hato Rey', 'Argosy University-The Art Institute of California-Los Angeles', 
            'Lester E Cox Medical Center-School of Medical Technology', 'ITT Technical Institute-Richardson', 'ITT Technical Institute-Arnold', 'ITT Technical Institute-Albany', 'ITT Technical Institute-Liverpool', 'Centura College-North Charleston', 'Vatterott College-St Joseph', 'ITT Technical Institute-Saint Rose', 'ITT Technical Institute-Richmond', 'ITT Technical Institute-Lathrop', 'Everest Institute-Greenspoint', 'Everest University-Jacksonville', 'ITT Technical Institute-Wilmington', 'Southeastern School of Cosmetology', 'ITT Technical Institute-Levittown', 
            'Sanford-Brown College-Orlando', "MJ's Beauty Academy Inc", 'ITT Technical Institute-Springfield', 'ITT Technical Institute-Chantilly', 'Lincoln Technical Institute-Northeast Philadelphia', 'Lincoln Technical Institute-Center City Philadelphia', "David's Academy of Beauty", 'ITT Technical Institute-Canton', 'ITT Technical Institute-Plymouth Meeting', 'Everest College-Dallas', 'Southeastern College-Jacksonville', 'ITT Technical Institute-Duluth', 'ITT Technical Institute-Hilliard', 'Le Cordon Bleu College of Culinary Arts-Atlanta', 'In Session Arts of Cosmetology Beauty School', 
            'Institute of Hair Design', 'Medical Professional Institute', 'The Art Institute of Tucson', 'ITT Technical Institute-Eden Prairie', 'Le Cordon Bleu College of Culinary Arts-Las Vegas', 'University of Phoenix-Minnesota', 'Kaplan College-Lubbock', 'Xtreme Career Institute', 'Credence Institute of Beauty', 'The Art Institute of Ohio-Cincinnati', 'University of Phoenix-Iowa', 'Sanford-Brown College-Las Vegas', 'Le Cordon Bleu College of Culinary Arts-Miami', 'Le Cordon Bleu College of Culinary Arts-Minneapolis', 'ITT Technical Institute-Kansas City', 'ITT Technical Institute-Kennesaw', 
            'ITT Technical Institute-Owings Mills', 'ITT Technical Institute-Warrensville Heights', 'ITT Technical Institute-Charlotte South', 'ITT Technical Institute-Clovis', 'ITT Technical Institute-Dunmore', 'ITT Technical Institute-Swartz Creek', 'ITT Technical Institute-Lexington', 'ITT Technical Institute-Maumee', 'ITT Technical Institute-Oklahoma City', 'ITT Technical Institute-Tulsa', 'University of Phoenix-Connecticut', 'Miami-Jacobs Career College-Springboro', 'Daymar College-Madisonville', 'The Art Institute of Salt Lake City', 'Ultimate Medical Academy-Tampa', 'ITT Technical Institute-St Petersburg', 
            'ITT Technical Institute-Columbia', 'ITT Technical Institute-Wichita', 'ITT Technical Institute-Atlanta', 'ITT Technical Institute-Mobile', 'ITT Technical Institute-Chattanooga', 'ITT Technical Institute-South Bend', 'Sanford-Brown College-San Antonio', 'InterCoast Colleges-Carson', 'Digital Media Arts College', 'CollegeAmerica-Cheyenne', 'Argosy University-The Art Institute of California-Silicon Valley', 'ITT Technical Institute-Madison', 'ITT Technical Institute-Clive', 'ITT Technical Institute-Columbus', 'ITT Technical Institute-Phoenix', 'ITT Technical Institute-Madison', 
            'ITT Technical Institute-High Point', 'The Art Institutes International\x96Kansas City', 'Le Cordon Bleu College of Culinary Arts-Sacramento', 'Le Cordon Bleu College of Culinary Arts-Seattle', 'Le Cordon Bleu College of Culinary Arts-Cambridge', 'Le Cordon Bleu College of Culinary Arts-Dallas', 'American National University-Cincinnati', 'Ohio Business College-Hilliard', 'North Florida Academy', 'Charlotte School of Law', 'Global Health College', 'Dorsey Business Schools-Farmington Hills', 'The Art Institute of Washington-Dulles', 'Le Cordon Bleu College of Culinary Arts-St Louis', 
            'ITT Technical Institute-Madison', 'ITT Technical Institute-Springfield', 'ITT Technical Institute-Huntington', 'ITT Technical Institute-Concord', 'ITT Technical Institute-Fort Myers', 'ITT Technical Institute-Charlotte North', 'American National University-Columbus', 'Daymar College-Online', 'Golden State College of Court Reporting', 'ITT Technical Institute-Merrillville', 'ITT Technical Institute-Tallahassee', 'ITT Technical Institute-Salem', 'ITT Technical Institute-Akron', 'ITT Technical Institute-Corona', 'ITT Technical Institute-Johnson City', 'ITT Technical Institute-DeSoto', 
            'ITT Technical Institute-North Charleston', 'ITT Technical Institute-Aurora', 'ITT Technical Institute-Dearborn', 'ITT Technical Institute-Las Vegas', 'Avant Gard The School', 'Daymar College-Louisville', 'Cambridge Junior College-Woodland', 'Academy for Salon Professionals', 'ITT Technical Institute-Durham', 'ITT Technical Institute-Hanover', 'ITT Technical Institute-Oakland', 'Broadview University-Boise', 'South University-The Art Institute of Fort Worth', 'The Art Institute of Wisconsin', 'Brown Mackie College-Birmingham', 'ITT Technical Institute-Phoenix West', 'ITT Technical Institute-Brooklyn Center', 
            'ITT Technical Institute-Orlando', 'ITT Technical Institute-Waco', 'ITT Technical Institute-Myrtle Beach', 'Minneapolis Media Institute', 'Brown Mackie College-Oklahoma City', 'Sanford-Brown College-Brooklyn Center', 'ITT Technical Institute-Philadelphia', 'ITT Technical Institute-Marlton', 'ITT Technical Institute-West Palm Beach', 'ITT Technical Institute-Salem', 'ITT Technical Institute-Indianapolis East', 'ITT Technical Institute-Douglasville', 'ITT Technical Institute-Overland Park', 'American National University-Canton', 'Cosmotech School of Cosmetology', 'ITT Technical Institute-Pensacola', 'ITT Technical Institute-San Antonio East', 'Court Reporting Institute of St Louis', 'The Art Institute of St Louis', 'Trine University-Arizona Regional Campus', 'San Francisco College of Cosmetology', 'American National University-Stow', 'American National University-Willoughby Hills', 'Florida Career College-Kendall', 'American Academy of Cosmetology-Delray Beach', 'Le Cordon Bleu College of Culinary Arts - Orlando', 'Spartan College of Aeronautics and Technology']

common_closed = []
for college10 in college2010_rt['Institution name']:
	for college16 in college2016_rt['Institution name']:
		if college10 == college16:
			common.append(college10)
		else:
			continue
#print(len(common))
for school in common:
	if school in closed:
		common_closed.append(school)
	else:
		continue
print(len(common_closed))


'''print(len(college2010[college2010['Year institution was deleted from IPEDS'] != -2]))
print(len(college2010[(college2010['Year institution was deleted from IPEDS'] != -2) & (college2010['Institution size Category'] == 1)]))
print(len(college2010[(college2010['Year institution was deleted from IPEDS'] != -2) & (college2010['Institution size Category'] == 2)]))
print(len(college2010[(college2010['Year institution was deleted from IPEDS'] != -2) & (college2010['Institution size Category'] == 3)]))
print(len(college2011[(college2011['Year institution was deleted from IPEDS'] != -2) & (college2011['Institution size Category'] == 1)]))
print(len(college2011[(college2011['Year institution was deleted from IPEDS'] != -2) & (college2011['Institution size Category'] == 2)]))'''




