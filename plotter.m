function plotter()

qty1=1-((10^(-3)-10^(-5))/(0.87712*0.015))
qty2=1-((10^(-3)-10^(-5))/(0.88692*0.015))
qty3=1-((10^(-3)-10^(-5))/(0.60991*0.015))
qty4=1-((10^(-3)-10^(-5))/(0.65924*0.015))

vec1 = [1 qty1 qty2];
vec2 = [1 qty3 qty4];

X = linspace(0,2,3);

    plot(linspace(0,2,3), vec1, '*', 'color', 'blue')
    hold on;
    plot(linspace(0,2,3), vec2, '*', 'color', 'red')

    title('Change in maximum capacitance in red and blue, for upper and lower bounds of the inequality')

end 