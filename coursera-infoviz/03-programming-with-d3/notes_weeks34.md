# Complex shapes

## Drawing Lines

![](week3_01.PNG)
![](week3_02.PNG)

SVG has one feature that helps us with that, that's called Path. What Path does is that it has it own languages and using this language, we are able to draw anything we want by basically telling where to start and where to move to.

![](week3_03.PNG)
![](week3_04.PNG)
![](week3_05.PNG)
![](week3_06.PNG)
![](week3_07.PNG)


But the problem is, so now I don't want really to learn this whole language on how to draw things, to draw my data. I need something to convert that and d3 is going to help us by creating what we call generators. So, a generator is going to basically take your data and produce something on this language of the path. 

![](week3_08.PNG)
![](week3_09.PNG)

see that I'm using the scales inside the function to convert the data values to actual visual values, points.

So, right here we're just specifying what we need. We are not really computing that yet. But here on the bottom, is where we're going to actually draw something on our screen. So, we basically going to append the new path and one important thing here is that, because we are adding only one line element. So, on our SVG is going to be just one line element not one for each data point that I have. You'll see that I'm using datum and not data instead of that. So, this means that d3 won't go through the process of doing the joint thing. So, we won't have enter, remove or is it or anything like that. So, we basically going to attach data to this object and that's going to be the data that we're going to provide at any moment to anything that we have. So, that's how for example, here when we are changing the D attribute of our path, we just use our line generator and this line generator is going to take this list of data, use the x and y function that we specified here to generate a line.

![](week3_10.PNG)

### Practice

So we want to add the range, but here there is one important thing. The range usually we create it from 0 to something but here we want to create it inverted. We want to create it from body height to 0, and why we do that is because the coordinates of SVG start 0,0 from the top. So as things grow, things go down, but in our chart, we want as things grows, we want them to go up because our line that is higher means that the price was higher. So we want to invert these coordinates and in order to do that, we just invert the range here. So now we're going to map 0 to the body height that is basically, a high number. So if the product has a price of 0, it's going to be exactly as low as the height that have. At the same time if the product has the maximum value, it's going to be as high as 0 because it's going to be the distance from the top to that point. So that's the reason why we invert the range. So now, we want to see the scale and see how it looks like.

![](week3_11.PNG)

**interessante esse exemplo em que só mostra o eixo, serve para mostrar que ser invertermos os valores do range, o eixo também se inverte.**

The next step is to get the second one. Here, there is a tricky. So, in the data, we are getting the dates and the dates are in string format. We need to convert the date to a JavaScript date object. So JavaScript knows how to compute difference and orders of those objects. So before doing anything here, we're going to transform our data, and we going to map it such that we're going to return a new object. So first we have the date and the date in our file is on the few dates. So it will be d.date, but we can just create a new date. So this is going to create a new date object to replace the original string and JavaScript is going to convert that to a real date and we're going to take this opportunity also to make sure that our price is always a number. So we do that by adding this plus on the beginning that's going to force JavaScript to convert this string to a number. So now, our data is ready. 

![](week3_12.PNG)

So this creates our scale that we can use to deal with time so we're going to give a time and now D3 is going to give you as a value of the X position of our data. So let's see how this looks like. We're just going to create now an axis so we can see the data. So our next step is body.append, same thing. We're going to create a group so we can put it there. Then we're going to call, then we're going to create a new axis. So this time is on the bottom. So we're going to go axis bottom and we're going to provide our scale and you see that it created here on the top. So we have to fix that by translating our group so we can just do, at transform and we want to translate it, 0. Here, we're going to have the width or the height of our data. So, right now, we're just going to concatenate here, body height. 

![](week3_13.PNG)

So you see that now we have the axis on the bottom that is just less step that we have to perform that is, right now, you have a lot of overlap here because the format is not really good. So you're going to fix this format by formatting our axis. 

So we're going to say tick format and you're going to provide a format. D3 has a time format so we can use that. So we can do D3 time format. So D3 knows how to format the time in this masks that you can give. So, for example, percentage B means to show the month in abbreviated form and that's what we want to use. So we're going to do percentage B. So you see that now in the bottom, we're going to get of the month in abbreviated form.

![](week3_14.PNG)

Line generator:

![](week3_15.PNG)

Append path, bind datum to it, and point the "d" attribute to the line generator.

![](week3_16.PNG)

For some reason, there is some black stuff here and there is a line crossing it. This happens for two reasons. So first, path is going to close automatically whatever thing you are drawing. So, I am drawing a line that goes up here to the end. When it gets to the end, since I don't close it, path is going to just close it back. Although it doesn't draw it, you won't see a line really here, but it's assuming that there is something crossing back. Then, we also have, by default, everything that we build with the fill of black.

So, what we need to do is to format the line to look the way we want. So the first thing, we could just set the style here. But sometimes if you are reusing this line throughout multiple places, you have a complex format, it's actually easier to just use CSS. So, you're going to associate a class here to this element that you're going to call line, and then it can go all the way on the top on our style tag and create a class for that. 

![](week3_17.PNG)

![](week3_18.PNG)

So, the last step that we have here is that we have those weird lows here. If you look in the data, the reason is because we don't have value for those month. So, we don't really want to show that. We want the user to know that we don't have value and not be fooled think that the price dropped during those month. So, d3 provide us a method to tell the line generator if a value is defined or not. If it's not defined, d3 is going to make sure to break this line and showed then as two separated lines so you know that in that period you don't have information.

So, d3 provide us a method to tell the line generator if a value is defined or not. If it's not defined, d3 is going to make sure to break this line and showed then as two separated lines so you know that in that period you don't have information. So to do that, we can just do.defined, and then provide a function that given a data point it's going to tell you if it's defined or not. So for us here, we're just going to use the price as the definition of defined or not, and those two exclamation points here on the beginning basically converts the price that we have to a Boolean value. What this means is if I have the price, it's going to become true. If I have any value other than zero, it's going to become true. But if I have zero or I have no value, it's going to become false. So, this is going to do exactly what's defined as punctual because it expect the true or false. 

![](week3_19.PNG)

## Arcs

![](week3_20.PNG)
![](week3_21.PNG)
![](week3_22.PNG)

when we are talking about inner radius, we are talking about this radius that go inside your arc. So, if you want for example a pie shape, you just set its value to zero because then this whole white whole in the middle is going to shrink and disappear, and then you're going to get the pie shape. If you want more of a doughnut shape then you can increase and play with it's value. 

![](week3_23.PNG)
![](week3_24.PNG)
![](week3_25.PNG)

![](week3_26.PNG)
![](week3_27.PNG)
![](week3_28.PNG)

The problem now is I have data and my data is note in angles, my data is in values. It can be prices, it can be sales or anything like that. So, how am I going to transform this data to angles? So, the tree provides us with another function. It's what we call pie. 

![](week3_29.PNG)

So, the pie generator doesn't really generate path information as we have seen so far. It's going to add the new information to your object and in this specific case is going to be the angles. So, you're going to give your data to the generator, the generator is going to split our new object that contains the start and the end angles and also our data key that contains the rest of your information that you had originally on your object. So, most of the time what you're going to do is you're going to create your pie and you're going to provide a function inside value that's going to tell which value is going to define the angles. 

![](week3_30.PNG)

So, it's basically like a map. So, if you want for example to create a pie chart for sales, this function is going to return the amount of sales for each element that you are drawing. Then d3 is going to take care of computing the proportions and getting the right angles so you can end up with a pie shape, although here we're just computing the data. 

![](week3_31.PNG)

So, remember that if you are drawing arcs, you're going to go to this two intermediate step. So, the first step is converting your data from the data original space to an angle data. So, where you have information about the size of the angles for each element that you have in your data. Once you have that, you're going to use the arc generator to transform this information about angles in the actual path information. Information on how SVG is going to draw this arc. Then you're going to use this information that arc generate outputs to set the D attribute of your path, such that it's going to look as you expect it. As an arc or as a piece of a pie, depends on how you set your radius.

![](week3_32.PNG)

### Practice

Where we have a country, and we have an amount of sales on that country.

![](week3_33.PNG)
![](week3_34.PNG)

So we going to do our pie = d3.pie, and then we basically going to tell the values that we're going to use. So we're going to do value, and it's going to be d.sales, because those are our sales. And if I now call, instead of just log(data) I call pie(data),

![](week3_35.PNG)

You're going to see that our data comes with additional information. So here you're going to see that we have our data, but also at the end, you have start angle and end angle. So those are the information of the angles of our pie. So now we're going to be able to create the chart and tell d3 to draw arcs based on those angles.

Also, we have that our data is ready, and you'll see that the original data comes here inside a data element. So every time we need it to access information from the original data, you're going to have to add `.data` in between. So if I want to add access for example, the sales, I'm going to have to do `d.data.sales`. 

![](week3_36.PNG)

So now instead of using a scale, I am using pie to translate this data. But still, if I want to use different colors, for example, I still can use another scale to change the color based on the country. And that's what we want to add here, so we want to basically set a new scale. 

![](week3_37.PNG)

![](week3_38.PNG)

So here, we created a pie object that basically transform our data to a version where we have angles, start and end angles. So, it's basically trying to create arcs from the data that we have. But it doesn't really draw the arcs on the screen. It just compute those arcs and give this information for us. We need to create the next step that is actually draw things. So, to draw the information that Pi returns, we can create an arc object. An arc object is similar to a line chart, a line object that transform data in lines. So here, we're going to transform data in arcs. To create that, we basically going to use the d3.arc API. So, this creates the arc object that knows how to transform the information, but we need to provide the radius. The radius is going to be outer radius.

![](week3_39.PNG)

So, this creates the arc object, and our next step is to actually use this arc to draw something on the screen. So, we're going to start by first selecting from my body all the arcs that I already have. So, remember that when you want to draw something, you first have to select everything that you have, and then based on the data, d3 is going to create a join between this. So, we're going to select everything that has the class arc. The reason is because they are going to add a "g" here, but maybe this "g" may mix with other "g"s in the future, so in order to avoid confusion and make sure that I only selected "g"s that I'm looking for, I'm going to use a class arc so we know that "g" is a arc. So, we're going to select all the arcs that we have, and then we're going to append some data, we're going to join some data here. 

The first thing that I to do is, **I cannot just use my original data that I have here, because this doesn't contain the information of the angles**. I need to compute this information. [which I already have, when I used the pie generator] So, to do that, we can use our pie object. So, this basically computed a new version of the data, where I have the start and end angles. 

![](week3_40.PNG)

The arc function knows how to use this information to actually based on the radius that you gave, draw the actual arcs that we need. So, once we have that, we can create this actual visualization or draw the actual arcs. So, we're gonna draw then inside a "g" as I said, so we're going to append this "g" here.

![](week3_41.PNG)

The reason why we use "g" and not directly the path that is actually the one that's going to draw the thing, is because later, if you want to add more information for example the labels, it's easier to just add to those "g"s because there's going to be in the right position. So, it's much easier to work with that than actually trying to add a text separator. So, we create a "g", and you're going to assign that to a variable that I'm going to call "g" here. 

![](week3_42.PNG)

Set colors.

![](week3_43.PNG)

So, the whole original information that we have, for example in this case the country name, is not on d anymore. I have to do d.data, and then do country in order to get the name. But I need to convert the name of this country to an actual color, and we have a function scale for that that we can use that is called colorScale.

![](week3_44.PNG)

Okay, so almost there. So, this is going to create one color for each country, but still you see that is not drawing the arcs correct. So, one thing that we have to define here is the inner radius of our arc. So, this radius is our outer radius, and now we need to define the radius of the inside. 

![](week3_45.PNG)

Donut chart:

![](week3_46.PNG)

