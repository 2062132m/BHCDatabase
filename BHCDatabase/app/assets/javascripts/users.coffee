# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
    btn = undefined
    modal = undefined
    span = undefined
    modal = document.getElementById('modalcontainer')
    btn = document.getElementById('openmodal')
    span = document.getElementsByClassName('close')[0]

    pbtn = undefined
    pmodal = undefined
    pspan = undefined
    pmodal = document.getElementById('passwordmodalcontainer')
    pbtn = document.getElementById('openpasswordmodal')
    pspan = document.getElementsByClassName('close')[1]

    pbtn.onclick = ->
      pmodal.style.display = 'block'
      return

    pspan.onclick = ->
      pmodal.style.display = 'none'
      return

    window.onclick = (event) ->
      if event.target == pmodal
        pmodal.style.display = 'none'
      return

    btn.onclick = ->
      modal.style.display = 'block'
      return

    span.onclick = ->
      modal.style.display = 'none'
      return

    window.onclick = (event) ->
      if event.target == modal
        modal.style.display = 'none'
      if event.target == pmodal
        pmodal.style.display = 'none'
      return


  $(document).ready(ready)
  $(document).on('turbolinks:load', ready)
  $(document).on('page:load', ready)
