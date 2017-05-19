$fn=64;
union(){translate(v = [0.500, -4.500])
union(){rotate(a = [0, -90, 0])
linear_extrude(height = 1){polygon(points = [[0, 0], [3.500, 3.500], [3.500, 5.500], [0, 9.000], [0, 8.000], [2.500, 5.500], [2.500, 3.500], [0, 1], [0, 0]]);
}
translate(v = [-1, 5.500, 3.500])
rotate(a = [90, 0, 0])
linear_extrude(height = 2){polygon(points = [[0, 0], [1.000, 0.000], [0, 1], [0, 0]]);
}
}
}
