#include <kore/kore.h>
#include <kore/http.h>

int page(struct http_request *);

int
page(struct http_request *req) {
    struct kore_json_item *user;
    user= kore_json_create_item(NULL,NULL, KORE_JSON_TYPE_OBJECT);
    kore_json_create_string(user, "name", "dalong");
    kore_json_create_integer(user, "age", 18);
    kore_json_create_string(user, "version", "v1");
    http_response_json(req, 200, user);
    return (KORE_RESULT_OK);

}
