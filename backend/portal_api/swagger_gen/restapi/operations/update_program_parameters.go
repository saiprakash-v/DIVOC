// Code generated by go-swagger; DO NOT EDIT.

package operations

// This file was generated by the swagger tool.
// Editing this file might prove futile when you re-run the swagger generate command

import (
	"context"
	"net/http"

	"github.com/go-openapi/errors"
	"github.com/go-openapi/runtime"
	"github.com/go-openapi/runtime/middleware"
	"github.com/go-openapi/validate"

	"github.com/divoc/portal-api/swagger_gen/models"
)

// NewUpdateProgramParams creates a new UpdateProgramParams object
//
// There are no default values defined in the spec.
func NewUpdateProgramParams() UpdateProgramParams {

	return UpdateProgramParams{}
}

// UpdateProgramParams contains all the bound params for the update program operation
// typically these are obtained from a http.Request
//
// swagger:parameters updateProgram
type UpdateProgramParams struct {

	// HTTP Request Object
	HTTPRequest *http.Request `json:"-"`

	/*Update Vaccination Program
	  In: body
	*/
	Body *models.ProgramUpdateRequest
}

// BindRequest both binds and validates a request, it assumes that complex things implement a Validatable(strfmt.Registry) error interface
// for simple values it will use straight method calls.
//
// To ensure default values, the struct must have been initialized with NewUpdateProgramParams() beforehand.
func (o *UpdateProgramParams) BindRequest(r *http.Request, route *middleware.MatchedRoute) error {
	var res []error

	o.HTTPRequest = r

	if runtime.HasBody(r) {
		defer r.Body.Close()
		var body models.ProgramUpdateRequest
		if err := route.Consumer.Consume(r.Body, &body); err != nil {
			res = append(res, errors.NewParseError("body", "body", "", err))
		} else {
			// validate body object
			if err := body.Validate(route.Formats); err != nil {
				res = append(res, err)
			}

			ctx := validate.WithOperationRequest(context.Background())
			if err := body.ContextValidate(ctx, route.Formats); err != nil {
				res = append(res, err)
			}

			if len(res) == 0 {
				o.Body = &body
			}
		}
	}
	if len(res) > 0 {
		return errors.CompositeValidationError(res...)
	}
	return nil
}
