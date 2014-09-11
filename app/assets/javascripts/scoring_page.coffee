class TD.ScoringPage
  @valueClassMap: 
    "5": 'btn-success'
    "4": 'btn-primary'
    "3": 'btn-info'
    "2": 'btn-warning'
    "1": 'btn-danger'
  constructor: (responseId) ->
    @responseId = responseId
    $(document).ready @initListeners

  initListeners: =>
    $('.score-panel').on 'change', 'input[type=radio]', @onRadioChange
    @setInitialState()

  setInitialState: -> 
    for input in $('input[type=radio]:checked')
      $input = $(input)
      @setInputClass($input)
      $input.closest('label').addClass('active')

  onRadioChange: (ev) => 
    $input = $(ev.target)
    $group = $input.closest('.btn-group')
    $labels = $group.find('label').addClass('btn-default')
    for k,v of TD.ScoringPage.valueClassMap
      $labels.removeClass(v) 
    @setInputClass($input)

  setInputClass: ($input) ->
    $input.closest('label').addClass(TD.ScoringPage.valueClassMap[$input.val()])
