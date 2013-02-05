$ ->
  class Fading
    constructor: (@node)->
  Fading::show = (cb)->
    @node.fadeIn 250, cb
  Fading::hide = (cb)->
    n = @node
    setTimeout (-> n.fadeOut 500, cb), 1000

  links = new Fading $(".links_with_tag")

  $.getJSON '/tags.json', (tag2paths)->
    
    model =
      show_links_for_tag: (m, evt)->
        title = $('#the.post h1 .title').data("title")
        tag = $(evt.target).data("tag").toLowerCase()
        vals = tag2paths[tag].filter (e)-> e.title != title
        links.show -> model.links_shown true
        @tagname tag
        @links vals
        links.hide -> model.links_shown false
      links: ko.observableArray []
      tagname: ko.observable ""
      links_shown: ko.observable false

    model.empty = ko.dependentObservable -> model.links().length == 0

    ko.applyBindings model
    console.log "binded"
