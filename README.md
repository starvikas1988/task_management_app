<ul>
    <li>1.Clone it to the local environment</li>
    <li>2.Open console and run npm install, npm run dev</li>
    <li>3.Open terminal and run php artisan serve</li>
    <li>4.Run command php artisan migrate</li>
    <li>5.Run command: php artisan db:seed --class=TaskSeeder</li>
</ul>
<p>
    Api routes:
http://127.0.0.1:8000/


  GET|HEAD        api/tasks .............................................................. tasks.index › TaskController@index
  POST            api/tasks .............................................................. tasks.store › TaskController@store  
  GET|HEAD        api/tasks/{task} ......................................................... tasks.show › TaskController@show  
  PUT|PATCH       api/tasks/{task} ..................................................... tasks.update › TaskController@update  
  DELETE          api/tasks/{task} ................................................... tasks.destroy › TaskController@destroy  
  GET|HEAD        api/user ..................................................................................................  
  GET|HEAD        home .......................................................................... home › HomeController@index  
  GET|HEAD        login .......................................................... login › Auth\LoginController@showLoginForm  
  POST            login .......................................................................... Auth\LoginController@login  
  POST            logout ............................................................... logout › Auth\LoginController@logout  
 GET|HEAD        password/confirm ........................ password.confirm › Auth\ConfirmPasswordController@showConfirmForm  
  POST            password/confirm ................................................... Auth\ConfirmPasswordController@confirm  
  POST            password/email .......................... password.email › Auth\ForgotPasswordController@sendResetLinkEmail  
  GET|HEAD        password/reset ....................... password.request › Auth\ForgotPasswordController@showLinkRequestForm  
  POST            password/reset ....................................... password.update › Auth\ResetPasswordController@reset  
  GET|HEAD        password/reset/{token} ........................ password.reset › Auth\ResetPasswordController@showResetForm  
  GET|HEAD        register .......................................... register › Auth\RegisterController@showRegistrationForm  
  POST            register ................................................................. Auth\RegisterController@register  
  GET|HEAD        sanctum/csrf-cookie ..................... sanctum.csrf-cookie › Laravel\Sanctum › CsrfCookieController@show  

Create Task:

GET
http://127.0.0.1:8000/api/task

POST
http://127.0.0.1:8000/api/task

payload:
{
    user_id:1,
    title: 'Title',
    description: 'Description',
    due_date: '2024/09/05',
    priority: 'Low'
}

http://127.0.0.1:8000/api/task/2
PUT
payload:
{
    user_id:1,
    title: 'Title',
    description: 'Description',
    due_date: '2024/09/05',
    priority: 'Low'
}

http://127.0.0.1:8000/api/task/2

DELETE




</p>
<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400" alt="Laravel Logo"></a></p>

<p align="center">
<a href="https://github.com/laravel/framework/actions"><img src="https://github.com/laravel/framework/workflows/tests/badge.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/dt/laravel/framework" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/v/laravel/framework" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://img.shields.io/packagist/l/laravel/framework" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

You may also try the [Laravel Bootcamp](https://bootcamp.laravel.com), where you will be guided through building a modern Laravel application from scratch.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 2000 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## Laravel Sponsors

We would like to extend our thanks to the following sponsors for funding Laravel development. If you are interested in becoming a sponsor, please visit the Laravel [Patreon page](https://patreon.com/taylorotwell).

### Premium Partners

- **[Vehikl](https://vehikl.com/)**
- **[Tighten Co.](https://tighten.co)**
- **[Kirschbaum Development Group](https://kirschbaumdevelopment.com)**
- **[64 Robots](https://64robots.com)**
- **[Cubet Techno Labs](https://cubettech.com)**
- **[Cyber-Duck](https://cyber-duck.co.uk)**
- **[Many](https://www.many.co.uk)**
- **[Webdock, Fast VPS Hosting](https://www.webdock.io/en)**
- **[DevSquad](https://devsquad.com)**
- **[Curotec](https://www.curotec.com/services/technologies/laravel/)**
- **[OP.GG](https://op.gg)**
- **[WebReinvent](https://webreinvent.com/?utm_source=laravel&utm_medium=github&utm_campaign=patreon-sponsors)**
- **[Lendio](https://lendio.com)**

## Contributing

Thank you for considering contributing to the Laravel framework! The contribution guide can be found in the [Laravel documentation](https://laravel.com/docs/contributions).

## Code of Conduct

In order to ensure that the Laravel community is welcoming to all, please review and abide by the [Code of Conduct](https://laravel.com/docs/contributions#code-of-conduct).

## Security Vulnerabilities

If you discover a security vulnerability within Laravel, please send an e-mail to Taylor Otwell via [taylor@laravel.com](mailto:taylor@laravel.com). All security vulnerabilities will be promptly addressed.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
