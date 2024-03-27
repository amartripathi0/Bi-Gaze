import React from 'react'
import ReactDOM from 'react-dom/client'
import App from './App.tsx'
import './index.css'
import { createBrowserRouter , createRoutesFromElements  , Route, RouterProvider} from 'react-router-dom';
import Home from './pages/homepages/home/Home.tsx';


const routes = [
  <Route path = "/" element = {<App />} >
      <Route path='/home' element = {<Home/>}/>
      <Route path='/' element = {<Home/>}/>
    </Route>
]
const router= createBrowserRouter(createRoutesFromElements(
      routes
))


ReactDOM.createRoot(document.getElementById('root')!).render(

  <React.StrictMode>
  <RouterProvider router={router} />
  </React.StrictMode>,
)
