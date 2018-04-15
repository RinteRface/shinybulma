function findOutputForSlider( element ) {
   var idVal = element.id;
   outputs = document.getElementsByTagName( 'output' );
   for( var i = 0; i < outputs.length; i++ ) {
     if ( outputs[ i ].htmlFor == idVal )
       return outputs[ i ];
   }
}

function getSliderOutputPosition( slider ) {
  // Update output position
  var newPlace,
      minValue;

  var style = window.getComputedStyle( slider, null );
  // Measure width of range input
  sliderWidth = parseInt( style.getPropertyValue( 'width' ), 10 );

  // Figure out placement percentage between left and right of input
  if ( !slider.getAttribute( 'min' ) ) {
    minValue = 0;
  } else {
    minValue = slider.getAttribute( 'min' );
  }
  var newPoint = ( slider.value - minValue ) / ( slider.getAttribute( 'max' ) - minValue );

  // Prevent bubble from going beyond left or right (unsupported browsers)
  if ( newPoint < 0 ) {
    newPlace = 0;
  } else if ( newPoint > 1 ) {
    newPlace = sliderWidth;
  } else {
    newPlace = sliderWidth * newPoint;
  }

  return {
    'position': newPlace + 'px'
  }
}

document.addEventListener( 'DOMContentLoaded', function () {
  // Get all document sliders
  var sliders = document.querySelectorAll( 'input[type="range"].slider' );
  [].forEach.call( sliders, function ( slider ) {
    var output = findOutputForSlider( slider );
    if ( output ) {
      if ( slider.classList.contains( 'has-output-tooltip' ) ) {
        // Get new output position
        var newPosition = getSliderOutputPosition( slider );

        // Set output position
        output.style[ 'left' ] = newPosition.position;
      }

      // Add event listener to update output when slider value change
      slider.addEventListener( 'input', function( event ) {
        if ( event.target.classList.contains( 'has-output-tooltip' ) ) {
          // Get new output position
          var newPosition = getSliderOutputPosition( event.target );

          // Set output position
          output.style[ 'left' ] = newPosition.position;
        }
        
        // Update output with slider value
        output.value = event.target.value;
      } );
    }
  } );
} );

var bulmaSliderInput = new Shiny.InputBinding();
$.extend(bulmaSliderInput, {
  find: function(scope) {
    return $(scope).find(".bulmaSliderInput");
  },
  getValue: function(el) {
    return parseInt($(el).val());
  },
  subscribe: function(el, callback) {
    $(el).on("change.bulmaSliderInput", function(e) {
      callback();
    });
  },
  unsubscribe: function(el) {
    $(el).off(".bulmaSliderInput");
  },
  getRatePolicy: function getRatePolicy() {
    return {
      policy: 'debounce',
      delay: 250
    };
  }
});

Shiny.inputBindings.register(bulmaSliderInput);