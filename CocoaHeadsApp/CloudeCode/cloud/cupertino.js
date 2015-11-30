var _ = require("underscore");

var BASE_URL = "http://www.cocoaheads.com.br";
var DEFAULT_HEADERS = {"Content-Type": "application/json;charset=utf-8"}

function createSyncJob(clazz, route, mapping) {
  var jobName = "sync" + clazz.className + "s"

  Parse.Cloud.job(jobName, function(request, status) {
    Parse.Cloud.httpRequest({
      url: BASE_URL + route,
      headers: DEFAULT_HEADERS
    }).then(function(httpResponse) {
      var batchOperationPromise = Parse.Promise.as();

      batchOperationPromise.then(function() {
        var promise = Parse.Promise.as();

        _.each(httpResponse.data, function(json) {
          promise = promise.then(function() {
            var query = new Parse.Query(clazz);
            query.equalTo("cupertinoId", json["id"]);

            return query.find().then(function(results) {
              var instance = results.length > 0 ? results[0] : new clazz();
              for (key in mapping) {
                instance.set(key, json[mapping[key]]);
              }

              return instance.save();
            })
          });
        });

        return promise;

      }).then(function() {
        status.success("success syncing " + clazz.className);
      });

    }, function(httpResponse) {
      status.error("error syncing " + clazz.className);
    });
  });
}

var Podcast = Parse.Object.extend("Podcast");
createSyncJob(Podcast, "/podcasts.json", {
  "cupertinoId": "id",
  "title": "title",
  "description": "description",
  "tags": "tags",
  "soundcloudUrl": "soundcloud_url",
  "soundcloudId": "soundcloud_id"
});

var Chapter = Parse.Object.extend("Chapter");
createSyncJob(Chapter, "/cidades.json", {
  "cupertinoId": "id",
  "state": "estado",
  "city": "cidade",
  "organizer": "organizador",
  "email": "email"
});

var Event = Parse.Object.extend("Event");
createSyncJob(Event, "/agendas/todas.json", {
  "cupertinoId": "id",
  "name": "nome",
  // "date": "data",
  "venue": "local",
  "address": "endereco",
  "description": "descricao",
  "meetupUrl": "meetup",
  "rsvpCount": "total"
});
