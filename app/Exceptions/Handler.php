<?php

namespace App\Exceptions;

use Mail;
use Exception;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use App\Error;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that should not be reported.
     *
     * @var array
     */
    protected $dontReport = [
        \Illuminate\Auth\AuthenticationException::class,
        \Illuminate\Auth\Access\AuthorizationException::class,
        \Symfony\Component\HttpKernel\Exception\HttpException::class,
        \Illuminate\Database\Eloquent\ModelNotFoundException::class,
        \Illuminate\Session\TokenMismatchException::class,
        \Illuminate\Validation\ValidationException::class,
    ];


    public function report(Exception $exception) {
		if ($exception instanceof \Exception) {
	        // emails.exception is the template of your email
	        // it will have access to the $error that we are passing below
			if ($exception->getMessage()) {
				if (env('ERRORS_DB')) {
					Error::create([
						'message' => $exception->getMessage(),
						'file' => $exception->getFile(),
						'line' => $exception->getLine(),
						'trace' => collect($exception->getTrace())->implode('file', '\n')
					]);
				}
				if (env('ERRORS_MAIL') && config('maguttiCms.developer.email')) {
					Mail::send(
						'emails.exception',
						['error' => $exception->getMessage(), 'file' => $exception->getFile(), 'line' => $exception->getLine(), 'trace' => $exception->getTrace()],
						function ($message) {
							$message->subject(trans('Laravel Error on '.config('maguttiCms.website.option.app.name')));
							$message->from('maguttiCms@gfstudio.com', config('maguttiCms.website.option.app.name'));
							$message->to(config('maguttiCms.developer.email'));
						}
					);
				}
			}
	    }
        return parent::report($exception);
    }

    /**
     * Render an exception into an HTTP response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Exception  $exception
     * @return \Illuminate\Http\Response
     *
     */


    public function render($request, Exception $e)
    {
        if ($e instanceof ModelNotFoundException) {
            $e = new NotFoundHttpException($e->getMessage(), $e);
        }
        else if( $e instanceof  NotFoundHttpException ) return Redirect::to('/');

        return parent::render($request, $e);
    }

    /**
     * Convert an authentication exception into an unauthenticated response.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Illuminate\Auth\AuthenticationException  $exception
     * @return \Illuminate\Http\Response
     */
    protected function unauthenticated($request, AuthenticationException $exception)
    {
        if ($request->expectsJson()) {
            return response()->json(['error' => 'Unauthenticated.'], 401);
        }
        return redirect()->guest('login');
    }
}
