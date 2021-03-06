
$("#previous a,#next a,").pxgradient({ //произвольный селектор jQuery
  step: 10, // размер шага градиента в пикселях. Меньше шаг - больше качество, но меньше производительность
  colors: ["#b29457","#fbf7c7","#b29457"], // цвета. формат - hex (#4fc05a или #333)
  dir: "x" // направление градиента. x - горизонтальное, y - вертикальное
});
$("#numbers a, a.view-all").not('.current').pxgradient({ //произвольный селектор jQuery
  step: 1, // размер шага градиента в пикселях. Меньше шаг - больше качество, но меньше производительность
  colors: ["#9e844f","#fbf7c7","#9e844f"], // цвета. формат - hex (#4fc05a или #333)
  dir: "y" // направление градиента. x - горизонтальное, y - вертикальное
});
$("#footer_l").pxgradient({ //произвольный селектор jQuery
  step: 10, // размер шага градиента в пикселях. Меньше шаг - больше качество, но меньше производительность
  colors: ["#b6995c","#faf6c7","#bca166"], // цвета. формат - hex (#4fc05a или #333)
  dir: "x" // направление градиента. x - горизонтальное, y - вертикальное
});
$("#footer_l a").pxgradient({ //произвольный селектор jQuery
  step: 10, // размер шага градиента в пикселях. Меньше шаг - больше качество, но меньше производительность
  colors: ["#b6995c","#faf6c7","#bca166"], // цвета. формат - hex (#4fc05a или #333)
  dir: "x" // направление градиента. x - горизонтальное, y - вертикальное
});
$("#footer_r").pxgradient({ //произвольный селектор jQuery
  step: 10, // размер шага градиента в пикселях. Меньше шаг - больше качество, но меньше производительность
  colors: ["#b29557","#fbf7c8","#b29557"], // цвета. формат - hex (#4fc05a или #333)
  dir: "x" // направление градиента. x - горизонтальное, y - вертикальное
});

