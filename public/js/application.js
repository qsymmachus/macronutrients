$(document).ready(function() {
  allFoods = new Foods()
  gatherFoodData();
  hoverHighlight();
});


function hoverHighlight(){
  $('h2 a').each(function(index, h2){
    $(h2).on('mouseover',function(){
      $('.radar-chart-serie'+index).css('fill-opacity', '1');
    });
    $(h2).on('mouseout', function(){
      $('.radar-chart-serie'+index).css('fill-opacity', '.2');
    });
  })
}

function Food(name){
  this.name = name
  this.nutritionInfo = []
}

function gatherFoodData(){
 $('.hidden').children().each(function(){
    var nutritionInfo = []
    var foodName = $(this).attr('class')
    $(this).children().each(function(){
      var nutrient = $(this).attr('data-nutrient');
      var value = parseFloat($(this).attr('data-value'));
      nutritionInfo.push({axis: nutrient, value: value});
    })

    allFoods.foods.push(nutritionInfo)
  })
  if (allFoods.foods.length > 0){
    allFoods.drawChart();
  }
}

function Foods(){
  this.foods = []
}

Foods.prototype.drawChart = function(){
  RadarChart.draw('#svg', this.foods)
}

