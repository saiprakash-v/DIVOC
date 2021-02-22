// Code generated by go-swagger; DO NOT EDIT.

package operations

// This file was generated by the swagger tool.
// Editing this file might prove futile when you re-run the swagger generate command

import (
	"net/http"

	"github.com/go-openapi/runtime"
)

// ConfigureSlotFacilityOKCode is the HTTP code returned for type ConfigureSlotFacilityOK
const ConfigureSlotFacilityOKCode int = 200

/*ConfigureSlotFacilityOK OK

swagger:response configureSlotFacilityOK
*/
type ConfigureSlotFacilityOK struct {
}

// NewConfigureSlotFacilityOK creates ConfigureSlotFacilityOK with default headers values
func NewConfigureSlotFacilityOK() *ConfigureSlotFacilityOK {

	return &ConfigureSlotFacilityOK{}
}

// WriteResponse to the client
func (o *ConfigureSlotFacilityOK) WriteResponse(rw http.ResponseWriter, producer runtime.Producer) {

	rw.Header().Del(runtime.HeaderContentType) //Remove Content-Type on empty responses

	rw.WriteHeader(200)
}

// ConfigureSlotFacilityBadRequestCode is the HTTP code returned for type ConfigureSlotFacilityBadRequest
const ConfigureSlotFacilityBadRequestCode int = 400

/*ConfigureSlotFacilityBadRequest Invalid input

swagger:response configureSlotFacilityBadRequest
*/
type ConfigureSlotFacilityBadRequest struct {
}

// NewConfigureSlotFacilityBadRequest creates ConfigureSlotFacilityBadRequest with default headers values
func NewConfigureSlotFacilityBadRequest() *ConfigureSlotFacilityBadRequest {

	return &ConfigureSlotFacilityBadRequest{}
}

// WriteResponse to the client
func (o *ConfigureSlotFacilityBadRequest) WriteResponse(rw http.ResponseWriter, producer runtime.Producer) {

	rw.Header().Del(runtime.HeaderContentType) //Remove Content-Type on empty responses

	rw.WriteHeader(400)
}