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



