*** Settings ***
Library         AppiumLibrary

*** Variables ***
${timeout}                  10
${buttonAgree}              id=com.happyfresh.staging:id/ui_view_privacy_policy_button_agree
${buttonAgreeClickable}     //android.widget.Button[@resource-id='com.happyfresh.staging:id/ui_view_privacy_policy_button_agree' and @enabled="true"]
${onBoardingNextButton}     id=com.happyfresh.staging:id/ui_view_next_on_boarding_button
${onBoardingFinishButton}   id=com.happyfresh.staging:id/ui_view_letsgo_on_boarding_button
${allowLocationButton}      id=com.android.packageinstaller:id/permission_allow_button
${homeView}                 id=com.happyfresh.staging:id/ui_view_home_recycler_view
${topPickSection}           //android.view.ViewGroup//android.widget.LinearLayout//android.widget.TextView[@text='HappyFresh Top Picks']
${fruitText}                //android.widget.TextView[@resource-id='com.happyfresh.staging:id/ui_view_store_info_description_textview' and @text='Fruit']
${storeHomeView}            id=com.happyfresh.staging:id/component_store_home
${snackSection}             //android.widget.TextView[@resource-id='com.happyfresh.staging:id/text_view_category_name' and @text='Snacks']
${productListSection}       id=com.happyfresh.staging:id/ui_view_product_list_recycler_view
${productDetailSection}     id=com.happyfresh.staging:id/component_product_detail
${firstProduct}             //android.widget.LinearLayout[@index='0']
${firstSnack}               //android.widget.LinearLayout[@index='0']//android.widget.RelativeLayout//android.widget.Button[@resource-id='com.happyfresh.staging:id/ui_view_product_list_add_to_cart_button' and @text='+ Add']
${secondSnack}              //android.widget.LinearLayout[@index='1']//android.widget.RelativeLayout//android.widget.Button[@resource-id='com.happyfresh.staging:id/ui_view_product_list_add_to_cart_button' and @text='+ Add']
${cartIcon}                 id=com.happyfresh.staging:id/ui_view_cart_menu_icon
${addedItem}                id=com.happyfresh.staging:id/ui_view_product_cart_container
${deliverToNavigation}      //android.widget.RelativeLayout//android.widget.ImageView[@resource-id='com.happyfresh.staging:id/ui_view_address_info_chevron']
${deliverToSearchField}     id=com.happyfresh.staging:id/search_src_text
${locationSuggestion}       //android.widget.TextView[@resource-id='com.happyfresh.staging:id/ui_view_suggestion_address_location_secondary' and @text='Thiam Ruam Mit Road, Huai Khwang, Bangkok, Thailand']
${confirmLocationButton}    id=com.happyfresh.staging:id/ui_view_popup_dialog_primary_action_button
${homeMenuNavigation}       id=com.happyfresh.staging:id/home_bottom_navigation
${accountMenuNavigation}    id=com.happyfresh.staging:id/account_bottom_navigation
${loginNavigation}          id=com.happyfresh.staging:id/component_drawer_user_info
${loginTextLink}            //android.widget.TextView[@resource-id='com.happyfresh.staging:id/login']
${loginForm}                //android.widget.RelativeLayout//android.widget.Button[@text='LOG IN']
${emailField}               id=com.happyfresh.staging:id/email
${passwordField}            id=com.happyfresh.staging:id/password
${loginButton}              id=com.happyfresh.staging:id/login
${myAccountPage}            id=com.happyfresh.staging:id/account_container
${myAccountPageBackButton}  //android.widget.ImageButton[@enabled="true"]
${loginErrorMessage}        //android.widget.TextView[@resource-id='com.happyfresh.staging:id/content' and @text='Wrong email and(or) password']

*** Keywords ***
User open application
    open application                    http://localhost:4723/wd/hub    platformName=Android	deviceName=192.168.183.101:5555     appPackage=com.happyfresh.staging   appActivity=com.happyfresh.ui.module.splash.SplashActivity      automationName=Uiautomator2
    wait until page contains element    ${buttonAgreeClickable}     ${timeout}
    click element                       ${buttonAgree}
    wait until page contains element    ${onBoardingNextbutton}     ${timeout}
    click element                       ${onBoardingNextButton}
    click element                       ${onBoardingNextButton}
    click element                       ${onBoardingNextButton}
    click element                       ${onBoardingFinishButton}
    wait until page contains element    ${allowLocationButton}      ${timeout}
    click element                       ${allowLocationButton}
    wait until page contains element    ${homeView}                 ${timeout}
    wait until page contains element    ${accountMenuNavigation}    ${timeout}
    log source                          App opened succussfully

User navigate to login page
    click element                       ${accountMenuNavigation}
    wait until page contains element    ${loginNavigation}          ${timeout}
    click element                       ${loginNavigation}
    wait until page contains element    ${loginTextLink}            ${timeout}
    click element                       ${loginTextLink}

User should be directed to login page
    wait until element is visible       ${loginForm}                ${timeout}
    element should be visible           ${loginForm}

User input email address
    [Arguments]                         ${email}
    input text                          ${emailField}               ${email}

User input password
    [Arguments]                         ${password}
    input password                      ${passwordField}            ${password}

User click login button
    click element                       ${loginButton}

User should be directed to my account page
    wait until element is visible       ${myAccountPage}            ${timeout}
    element should be visible           ${myAccountPage}
    log source                          User successfully login

User close application
    close application
    log source                          End of test, application is closed

User already logged in
    [Arguments]                         ${email}                    ${password}
    click element                       ${accountMenuNavigation}
    wait until page contains element    ${loginNavigation}          ${timeout}
    click element                       ${loginNavigation}
    wait until page contains element    ${loginTextLink}            ${timeout}
    click element                       ${loginTextLink}
    wait until page contains element    ${loginForm}                ${timeout}
    input text                          ${emailField}               ${email}
    input password                      ${passwordField}            ${password}
    click element                       ${loginButton}
    wait until page contains element    ${myAccountPage}            ${timeout}
    wait until page contains element    ${myAccountPageBackButton}  ${timeout}
    click element                       ${myAccountPageBackButton}

User navigate to home page
    wait until page contains element    ${homeMenuNavigation}       ${timeout}
    click element                       ${homeMenuNavigation}

User should be directed to home page
    wait until element is visible       ${homeView}                 ${timeout}
    element should be visible           ${homeView}

User add valid address which in coverage area
    wait until page contains element    ${deliverToNavigation}      ${timeout}
    click element                       ${deliverToNavigation}
    wait until page contains element    ${deliverToSearchField}     ${timeout}
    input text                          ${deliverToSearchField}     ${address}
    wait until page contains element    ${locationSuggestion}       ${timeout}
    click element                       ${locationSuggestion}
    wait until page contains element    ${confirmLocationButton}    ${timeout}
    click element                       ${confirmLocationButton}
    wait until page contains element    ${homeView}                 ${timeout}

User select "Fruit" from "HappyFresh Top Picks" section
    wait until page contains element    ${topPickSection}           ${timeout}
    wait until page contains element    ${fruitText}                ${timeout}
    click element                       ${fruitText}

User should be directed to selected market page
    wait until element is visible       ${storeHomeView}            ${timeout}
    element should be visible           ${storeHomeView}

User select "Snacks" category
    wait until page contains element    ${snackSection}             ${timeout}
    click element                       ${snackSection}

Product list should be visible to user
    wait until element is visible       ${productListSection}       ${timeout}
    element should be visible           ${productListSection}

User click first product from the list
    wait until page contains element    ${firstProduct}             ${timeout}
    click element                       ${firstProduct}

Product details/description should be visible to user
    wait until element is visible       ${productDetailSection}     ${timeout}
    element should be visible           ${productDetailSection}

User adds first 2 item of "Snacks" category to cart
    wait until page contains element    ${firstSnack}               ${timeout}
    wait until page contains element    ${secondSnack}              ${timeout}
    click element                       ${firstSnack}
    click element                       ${secondSnack}

User navigate to cart page
    wait until page contains element    ${cartIcon}                 ${timeout}
    click element                       ${cartIcon}

Added item should be visible in cart page
    wait until element is visible       ${addedItem}                ${timeout}
    element should be visible           ${addedItem}

Error message should be displayed
    wait until element is visible       ${loginErrorMessage}        ${timeout}
    element should be visible           ${loginErrorMessage}

