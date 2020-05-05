function plotty(vec1,vec2)
   plot(linspace(1,length(vec1),length(vec1)), vec1, 'g. ')
    title('{\color{blue} METHODS 1 AND 2: base pair mismatch at position 5}')
    xlabel('TARGET SEQUENCE POSITION')
    ylabel('EXPECTED NUMBER OF VISITS OF THE RANDOM WALK')
    hold on;
    plot(linspace(1,length(vec2),length(vec2)), vec2, 'r. ')
end 