$ ->
  class Fading
    constructor: (@node)->
  Fading::show = (cb)->
    @node.fadeIn 250, cb
    @keep()
  Fading::keep = ->
    clearTimeout @tid
  Fading::hide = (cb)->
    n = @node
    @tid = setTimeout (-> n.fadeOut 400, cb), 550

  links = new Fading $(".links_with_tag")

  $.getJSON '/tags.json', (tag2paths)->
    
    model =
      show_links_for_tag: (m, evt)->
        title = $('#the.post h1 .title').data("title")
        tag = $(evt.target).data("tag").toLowerCase()
        lang = _page?.lang or "en"
        vals = tag2paths[lang][tag].filter (e)-> e.title != title
        links.show -> model.links_shown true
        @tagname tag
        @links vals
        _gaq.push(['_trackEvent', 'Tag', 'Show', tag, vals.length, true])

      keep: ->
        links.keep() if @links().length > 0
      hide_links_for_tag: (m, evt)->
        links.hide -> model.links_shown false
      links: ko.observableArray []
      tagname: ko.observable ""
      links_shown: ko.observable false

    model.empty = ko.dependentObservable -> model.links().length == 0

    ko.applyBindings model
