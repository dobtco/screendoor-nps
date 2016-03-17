projectId = "rg2W2SIZvZ7nL5fr"

fieldIds =
  email: 29506
  score: 29507
  comments: 29508
  cohort: 29519

storePrefix = "#{getUrlParameter('cohort')}-nps-"

showError = (message) ->
  $('.form_error').text(message).show()

showSuccess = ->
  $('.form_error').hide()

  $('form').velocity
    opacity: [0, 1],
    translateX: [-50, 0]
  ,
    display: 'none'
    complete: ->
      $('.success').velocity(
        opacity: [1, 0]
        translateY: [30, 0]
      ,
        display: 'block'
      )

translatedVals = ->
  vals = responseVals()
  newVals = {}

  for k, v of fieldIds
    newVals[v] = vals[k]

  newVals

persistToScreendoor = ->
  responses = translatedVals()

  $.ajax
    url: 'https://screendoor.dobt.co/api/form_renderer/save'
    type: 'post'
    dataType: 'json'
    data:
      v: 0
      response_id: store.get(storePrefix + 'id')
      submit: true
      project_id: projectId
      raw_responses: responses
    success: (data) ->
      store.set storePrefix + 'responses', responses
      store.set storePrefix + 'id', data.response_id
    error: ->
      store.unset storePrefix + 'responses'
      store.unset storePrefix + 'id'
      showError('Error saving your response.')

validateNps = (x) ->
  xInt = parseInt(x, 10)

  if xInt >= 0 && xInt <= 10
    xInt

responseVals = ->
  {
    cohort: getUrlParameter('cohort') || ''
    email: getUrlParameter('email') || ''
    score: validateNps(getUrlParameter('score'))
    comments: $('#comments').val()
  }

if responseVals().email && responseVals().score?
  # Save immediately unless already saved
  persistedFromStore = store.get(storePrefix + 'responses')
  unless persistedFromStore && (translatedVals() == persistedFromStore)
    persistToScreendoor()

# If the user doesn't load the URL correctly, don't even show the form
else
  showError('Sorry, there was an error loading the page.')
  $('form').hide()

$('.js_score').text(responseVals().score)

$('form').on 'submit', (e) ->
  e.preventDefault()
  showSuccess()
  persistToScreendoor()
