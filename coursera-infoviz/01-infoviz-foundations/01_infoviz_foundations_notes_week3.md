# Week 3

### Fundamental graphs and data transformation

We defined what data is, and what data abstraction is, and why it's needed. 

The focus here now is to go from data, to visual representation. So, I will walk you through three main steps. 

* The first one is introducing the idea of going from data abstraction to graph design. 
* The second one is, the introduction of a number of fundamental graphs, and their variations. 
* And then we will conclude with a section on data transformation. 

So, part of the problem in data visualization is not only how to visualize something, but also what kind of transformation of the original data is needed, to create the visual representation that you need to solve the problem.

### How to visualize?

How do I go from data to a visual representation that helps you answer some important questions that you have about the data? 

one of the first things that you have to figure out is how do I transform all this information into a visual representation? This is a very complex step. So, one way I like to describe this is that we can break the problem down into two steps. 

* The first step is to decide what to visualize -- select and transform 
* the second step is about deciding how to visualize it -- choosing or designing an appropriate representation. 

Why did I put choose and design? Because choosing is exclusively about selecting an existing format that is appropriate for the goal that you have in mind. designing is more in general trying to create a novel representation for the problem that you have. 

### Fundamentals Graphs

This is a preview of the graphs I'm going to talk about. 

* The bar chart, 
* the scatter plot, 
* the matrix,
* the line chart and 
* the symbol map. 

Why do I do that? There are a number of reasons but most importantly because 

* they are widely adopted, 
* they are very effective and  
* they are very useful. 

A second reason is that they solve a very large percentage of visualization problems. It's really surprising how many problems out there can be solved by one of these five graphs or variants over these graphs. And maybe even more important these are an amazing training ground before you are able to discuss and design more sophisticated graphs. So, I find that they are from the pedagogical standpoint extremely useful. And as you will see they will allow us to reason about graphical configurations and graphical communication.

So the graphs that I'm going to show you can all be described as combinations of two or sometimes three attributes. Let's start with the first one probably the most popular, the bar chart. So before I start describing these charts let me tell you the charts that I'm going to show are almost all based on the vehicle collision data that we already used in previous lessons. When I'm using a different dataset, I'm going to tell you. So this first one bar chart, and the bar chart allows you to visualize how a quantity distributes across a set of categories. So every bar represents one category and the length of the bar represents a quantity. So it's a relationship between a set of categories and measured quantities that refer to these categories. In this specific example, what I put here is the number of vehicle collisions for different boroughs in New York City. So you have boroughs on the x axis and the count of vehicle collisions on the y axis. The next one is the line chart. So the line chart allows you to visualize how a quantity changes in relation to another quantity. Where this quantity typically is time, not always. The line chart can actually accommodate other information other than time, but in general it's mostly used for time. Okay. So in this specific case on the x axis we have time and on the y axis we have the amount or count of vehicle collisions over time. And as you can see we can identify some trends. The next one is the scatter plot. So, with the scatter plot we can visualize how a quantity relates to another quantity. In this specific scatter plot I am visualizing information coming from a food products dataset, where every single dot represents one food product. And on the x axis we have amount of calories and on the y axis we have amount of carbohydrates. And every single dot is placed in the position that represents the value of calories and the values of carbohydrates that these data point has. So scatter plot visualizes relationship between a quantity and quantity. The next one is a matrix. So in the matrix we are trying to visualize the relationship between two categories. So we have one categorical attribute on the y axis and another categorical attributes on the other axis. Here in this specific example I put in again data coming from the vehicle collisions dataset, and in the vehicle collisions dataset we have information about what vehicle types are involved in the collision. So here what they put in this table is vehicle one and vehicle two in rows and columns. And what you see within each cell is again the number of collisions that happen in the combination of these two vehicle types. The last one is the symbol map. It's a map. And the goal of the symbol map is to visualize how a quantity distributes across two spatial coordinates. So, in a map we have latitude and longitude and every single dot or symbol is placed in the location that represents the data point or the object that is represented on this map. In this specific case, again we have the vehicle collision data and every single dot represents one zip code. So every dot is a zip code and the size of this symbol represents how many collisions happened in the area represented by the zip code. So once again, a symbol map visualizes how a quantity distributes across two spatial coordinates. So, this is a summary of the graphs that I've just shown you and what kind of information, what kind of attributes, or combination of attributes can be represented with these graphs. So, in a bar chart you have a combination between a category typically on the x, but it can also be on the y axis, and a quantity. So in this slide I also put the symbol O to identify ordinal data. So when you see categorical C and ordinal O you know that this graph can accommodate both categorical attributes and ordinal attributes. Okay? So in a bar chart you can have on the x or y axis, a categorical or ordinal attribute, and a quantitative attribute, that is the connection between the category and the amount of that is calculated for this category. In a scatter plot, you have a relationship between two quantities, two quantitative attributes. Every single dot represents one data item and this data item is placed in the position that corresponds to the two quantities. In a matrix visualization we have the combination of two categories, of two categorical attributes. Or if you want, also between two ordinal attributes or even a combination of categorical and ordinal, and the value that is represented within each cell is a quantity. In a line chart we have typically on the x axis time or sometimes some other quantity, so another quantitative attribute. And on the y axis we have some quantities, some measurement. So a quantitative attribute. And finally, in the symbol map, we have spatial coordinates and symbols that are placed in the spatial coordinate of interest, and the size of the symbol represents a quantity. So we have space plus some quantity.

###