<?php

namespace App\Http\Controllers;

use App\Models\Task;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Auth\Access\AuthorizationException;


class TaskController extends Controller
{

    public function generateToken()
{
    // Get the authenticated user
    $user = Auth::user();
    $user_id = $user->id;
    
    if($user){
        $user = User::find($user_id);
        // Revoke previous tokens (optional, if you want to enforce a single active token per user)
        $user->tokens()->delete();
        
        // Generate a new API token for the user
        $token = $user->createToken('myTaskdata')->plainTextToken;
    }
    
    

    // Return the token as a JSON response
    return response()->json(['token' => $token]);
}


  
    public function revokeToken()
    {
        $user = Auth::user();
        $user_id = $user->id;
        if($user){
            $user = User::find($user_id);
            $user_id->tokens()->delete();
        }
        

        return response()->json(['message' => 'Token revoked successfully'], 200);
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $token = $this->generateToken();
        
        $user = Auth::user();
        $user_id = $user->id;
       
        $tasks = Task::where('user_id', $user_id);
       // dd($tasks);

         // Filter by priority and due date if provided
         if ($request->has('priority')) {
            $tasks->where('priority', $request->priority);
        }

        if ($request->has('due_date')) {
            $tasks->where('due_date', $request->due_date);
        }

        $data = $tasks->orderBy('due_date')->get();
       
        // dd($data);

        return response()->json([
            'token' => $token,
            'tasks' => $data,
            'user_id'=>$user_id,

        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
     // Store a new task
    public function store(Request $request)
    {
        $token = $this->generateToken();
        $validated = $request->validate([
            'user_id'=>'required',
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'due_date' => 'required|date',
            'priority' => 'required|in:Low,Medium,High',
        ]);

        $user = Auth::user();
        $user_id = $user->id;
       
        $task = Task::create($validated);

     
        return response()->json([
            'message' => 'Task created successfully.',
            'task' => $task,
            'token' => $token,
            'user_id'=>$user_id,
        ], 201);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */

     // Show a specific task
    public function show(Task $task)
    {
        $user = Auth::user();
        $user_id = $user->id;
        try {
            // Ensure the user can view the task

            if($user_id == $task->user_id){
                // If authorized, return the task as a JSON response
                return response()->json($task);
            }
            
    
        } catch (AuthorizationException $e) {
            // If not authorized, return a 403 response with an error message
            return response()->json(['message' => 'Forbidden: You do not have permission to view this task.'], 403);
        }
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */

     // Update an existing task
    public function update(Request $request, Task $task)
    {
        $token = $this->generateToken();
        $user = Auth::user();
        $user_id = $user->id;
         // Ensure the user can update the task
         if($user_id == $task->user_id){
            $validated = $request->validate([
                'title' => 'required|string|max:255',
                'description' => 'nullable|string',
                'due_date' => 'required|date',
                'priority' => 'required|in:Low,Medium,High',
            ]);
    
            $task->update($validated);
    
            return response()->json([
                'message' => 'Task updated successfully.',
                'task' => $task,
                'token' => $token,
            ]);
         }else{
            return response()->json([
                'message' => 'Task Not updated,Auth issue.',
            ]);
         }

       
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Task  $task
     * @return \Illuminate\Http\Response
     */

     // Delete a task
    public function destroy(Task $task)
    {
        // Ensure the user can delete the task
        $token = $this->generateToken();
        $user = Auth::user();
        $user_id = $user->id;
         // Ensure the user can update the task
         if($user_id == $task->user_id){

            $task->delete();

            return response()->json([
                'message' => 'Task deleted successfully.',
                'token' => $token,
            ], 200);
         }else{
            return response()->json([
                'message' => 'Task Not Deleted,Auth issue.',
            ]);
         }

        
    }
}
