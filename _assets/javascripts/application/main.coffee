projectId = "rg2W2SIZvZ7nL5fr"

fieldIds =
  email: 29506
  score: 29507
  comments: 29508

showError = (message) ->
  alert message

# showSuccess = ->

translatedVals = ->
  vals = responseVals()
  newVals = {}

  for k, v of fieldIds
    newVals[v] = vals[k]

  newVals

persistToScreendoor = ->
  vals = responseVals()

  if vals.email && vals.score
    responses = translatedVals()

    $.ajax
      url: 'https://screendoor.dobt.co/api/form_renderer/save'
      type: 'post'
      dataType: 'json'
      data:
        v: 0
        response_id: store.get('responseId')
        submit: true
        project_id: projectId
        raw_responses: responses
      success: (data) ->
        store.set 'persistedResponses', responses
        store.set 'responseId', data.response_id
      error: ->
        store.unset 'persistedResponses'
        store.unset 'responseId'
        showError('Error saving your response.')

  else
    showError('Some info is missing.')

validateNps = (x) ->
  xInt = parseInt(x, 10)

  if xInt >= 1 && xInt <= 10
    xInt

responseVals = ->
  {
    email: getUrlParameter('email') || ''
    score: validateNps(getUrlParameter('score')) || ''
    comments: $('#comments').val()
  }

# Save immediately unless already saved
unless store.get('persistedResponses') && (translatedVals() == store.get('persistedResponses'))
  persistToScreendoor()

$('form').on 'submit', (e) ->
  e.preventDefault()
  persistToScreendoor()
  $(@).hide()
