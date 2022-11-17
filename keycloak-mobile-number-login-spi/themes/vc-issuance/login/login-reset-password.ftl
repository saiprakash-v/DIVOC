<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true displayMessage=!messagesPerField.existsError('username'); section>
    <#if section = "header">
        ${msg("emailForgotTitle")}
    <#elseif section = "form">
        <div class="form-wrapper">
            <div class="${properties.kcFormOptionsWrapperClass!}">
                <span><a href="${url.loginUrl}"><img src="${url.resourcesPath}/img/vector-arrow.png"
                                                     alt=""> ${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
            </div>
            <div class="ndear-login-wrapper">
                <div id="kc-form" class="ndear-login-card-wrapper">
                    <div class="keycloak-form">
                        <p class="login-title">Forgot Password</p>
                        <div id="kc-form-wrapper">
                            <form id="kc-reset-password-form" action="${url.loginAction}" method="post">
                                <div class="${properties.kcFormGroupClass!}">
                                    <label for="username" class="${properties.kcLabelClass!}">Enter the registered email
                                        address</label>

                                    <div class="input-wrapper">
                                        <div class="input-field mobile">
                                            <input type="text" id="username" name="username" class="${properties.kcInputClass!}"
                                                   autofocus value="${(auth.attemptedUsername!'')}"
                                                   aria-invalid="<#if messagesPerField.existsError('username')>true</#if>"/>

                                        </div>
                                    </div>
                                </div>
                                <div class="${properties.kcFormGroupClass!}">

                                </div>
                                <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                           type="submit" value="${msg("doSubmit")}"/>
                                </div>
                                <#if messagesPerField.existsError('username')>
                                    <div class="alert-box error-alert">
                                        <div class="alert-heading"><img src="${url.resourcesPath}/img/vector-alert.png" alt="">
                                            Alert!
                                        </div>
                                        <div class="alert-message fst-italic">Please enter a valid email address!</div>
                                    </div>
                                </#if>
                            </form>
                        </div>
                    </div>

                </div>
                <div class="container-wrapper image-wrapper">
                    <img src="${url.resourcesPath}/img/forgot_password.png" alt="">
                </div>
            </div>
        </div>
    <#elseif section = "info" >
        <#if realm.duplicateEmailsAllowed>
            ${msg("emailInstructionUsername")}
        <#else>
            ${msg("emailInstruction")}
        </#if>
    </#if>
</@layout.registrationLayout>