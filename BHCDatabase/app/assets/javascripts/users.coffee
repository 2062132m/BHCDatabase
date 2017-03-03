# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

window.onload = ->
  btn = undefined
  modal = undefined
  span = undefined
  modal = document.getElementById('modalcontainer')
  btn = document.getElementById('openmodal')
  span = document.getElementsByClassName('close')[0]

  btn.onclick = ->
    modal.style.display = 'block'
    return

  span.onclick = ->
    modal.style.display = 'none'
    return

  window.onclick = (event) ->
    if event.target == modal
      modal.style.display = 'none'
    return

  return
