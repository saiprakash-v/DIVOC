<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=!messagesPerField.existsError('username','password') displayInfo=realm.password && realm.registrationAllowed && !registrationDisabled??; section>
    <#if section = "header">
        ${msg("loginAccountTitle")}
<#elseif section = "form">
        
        <div id="kc-form" class="ndear-login-card-wrapper w-100">
            <p class="login-title">Login to Administrator Portal</p>
            <div id="kc-form-wrapper">
                <#if realm.password>
                    <form id="kc-form-login" onsubmit="login.disabled = true; return true;" action="${url.loginAction}"
                          method="post">
                        <div class="${properties.kcFormGroupClass!}">
                            <label for="username"
                                   class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("username")}<#else>${msg("email")}</#if></label>

                            <#if usernameEditDisabled??>
                                <input tabindex="1" id="username" class="${properties.kcInputClass!}" name="username"
                                       value="${(login.username!'')}" type="text" disabled/>
                            <#else>

                                <div class="input-wrapper">
                                    <div class="input-field mobile">
                                        <input tabindex="1" id="username" class="${properties.kcInputClass!}"
                                               name="username" value="${(login.username!'')}" type="text" autofocus
                                               autocomplete="off"
                                               aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                        />
                                    </div>

                                </div>

                                <#if messagesPerField.existsError('username','password')>
                                    <span id="input-error" class="${properties.kcInputErrorMessageClass!}"
                                          aria-live="polite">
                                    ${kcSanitize(messagesPerField.getFirstError('username','password'))?no_esc}
                            </span>
                                </#if>
                            </#if>
                        </div>

                        <div class="${properties.kcFormGroupClass!}">
                            <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                            <div class="input-wrapper">
                                <div class="input-field mobile">
                                    <input tabindex="2" id="password" class="${properties.kcInputClass!}"
                                           name="password" type="password" autocomplete="off"
                                           aria-invalid="<#if messagesPerField.existsError('username','password')>true</#if>"
                                    />
                                </div>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${properties.kcFormSettingClass!}">
                            <div id="kc-form-options">
                                <#if realm.rememberMe && !usernameEditDisabled??>
                                    <div class="checkbox">
                                        <label>
                                            <#if login.rememberMe??>
                                                <input tabindex="3" id="rememberMe" name="rememberMe" type="checkbox"
                                                       checked> ${msg("rememberMe")}
                                            <#else>
                                                <input tabindex="3" id="rememberMe" name="rememberMe"
                                                       type="checkbox"> ${msg("rememberMe")}
                                            </#if>
                                        </label>
                                    </div>
                                </#if>
                            </div>

                        </div>

                        <div id="kc-form-buttons" class="${properties.kcFormGroupClass!}">
                            <input type="hidden" id="id-hidden-input" name="credentialId"
                                   <#if auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if>/>
                            <input tabindex="4"
                                   class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                   name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>

                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <#if realm.resetPasswordAllowed>
                                <span><a tabindex="5"
                                        href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></span>
                            </#if>
                        </div>
                    </form>
                </#if>
                <#if  message?has_content && (message.type != 'warning' || !isAppInitiatedAction??)>
                    <div class="pf-c-alert__icon">
                        <#if message.type = 'success'>
                            <div class = "alert-box success-alert">                          
                                <span class="${properties.kcFeedbackSuccessIcon!} pr-3"></span>
                                <span>${msg("successfulEmailResponse")}</span>
                            </div>
                        </#if>
                        <#if message.type = 'warning'>
                            <div class = "alert-box warning-alert">
                                <span class="${properties.kcFeedbackWarningIcon!}"></span>
                                <span >${kcSanitize(message.summary)?no_esc}</span>
                            </div>
                        </#if>
                        <#if message.type = 'error'>
                            <div class = "alert-box error-alert">
                                <span class="${properties.kcFeedbackErrorIcon!}"></span>
                                <span >${kcSanitize(message.summary)?no_esc}</span>
                            </div>
                        </#if>
                        <#if message.type = 'info'>
                            <div class = "alert-box info-alert">
                                <span class="${properties.kcFeedbackInfoIcon!}"></span>
                                <span>${kcSanitize(message.summary)?no_esc}</span>
                            </div>
                        </#if>
                    </div>
                    
                </#if>
            </div>
            
            <#if realm.password && social.providers??>
                <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}">
                    <hr/>
                    <h4>${msg("identity-provider-login-label")}</h4>

                    <ul class="${properties.kcFormSocialAccountListClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountListGridClass!}</#if>">
                        <#list social.providers as p>
                            <a id="social-${p.alias}"
                               class="${properties.kcFormSocialAccountListButtonClass!} <#if social.providers?size gt 3>${properties.kcFormSocialAccountGridItem!}</#if>"
                               type="button" href="${p.loginUrl}">
                                <#if p.iconClasses?has_content>
                                    <i class="${properties.kcCommonLogoIdP!} ${p.iconClasses!}" aria-hidden="true"></i>
                                    <span class="${properties.kcFormSocialAccountNameClass!} kc-social-icon-text">${p.displayName!}</span>
                                <#else>
                                    <span class="${properties.kcFormSocialAccountNameClass!}">${p.displayName!}</span>
                                </#if>
                            </a>
                        </#list>
                    </ul>
                </div>
            </#if>
            
        </div>
        <div class="container-wrapper title-wrapper">
                <img class="" src="${url.resourcesPath}/img/vc-tenant-login-image.png" alt="">
        </div>
        
    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !registrationDisabled??>
            <div id="kc-registration-container">
                <div id="kc-registration">
                    <span>${msg("noAccount")} <a tabindex="6"
                                                 href="${url.registrationUrl}">${msg("doRegister")}</a></span>
                </div>
            </div>
        </#if>
    </#if>

</@layout.registrationLayout>
