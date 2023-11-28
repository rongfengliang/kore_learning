#include <kore/kore.h>
#include <kore/http.h>

int		page(struct http_request *);

int
page(struct http_request *req)
{
    static char 	*html = "<html><body><h1>Reload this page</h1></body></html>";
    http_response(req, 200, html, strlen(html));
    return (KORE_RESULT_OK);
}
