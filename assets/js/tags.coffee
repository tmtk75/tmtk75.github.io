$ ->
  """
  $.ajax
    type: "GET"
    url: "/tags.json"
    success: (res)->
      console.log res
  """
  $.getJSON '/tags.json', (res)->
    console.log res
