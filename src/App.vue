<template>
  <div id="app" class="small-container">
    <h1>Employees</h1>
    <employee-form @add:employee="addEmployee" />
    <employee-table 
    :employees="employees"
    @delete:employee="deleteEmployee"
    @edit:employee="editEmployee" 
    />
  </div>
</template>

<script>
import EmployeeTable from '@/components/EmployeeTable.vue'
import EmployeeForm from '@/components/EmployeeForm.vue'


export default {
  name: 'app',
  components: {
    EmployeeTable,
    EmployeeForm,
  },
  data(){
    return{
      employees:[],
    }
  },

  mounted() {
    this.getEmployees()
  },

 


}


</script>




<style>
button {
  background: #009435;
  border: 1px solid #009435;
}

.small-container {
  max-width: 680px;
}
</style>

        {
          id: 1,
          name: 'Richard Hendricks',
          email: 'richard@piedpiper.com',
        },
        {
          id: 2,
          name: 'Bertram Gilfoyle',
          email: 'gilfoyle@piedpiper.com',
        },
        {
          id: 3,
          name: 'Dinesh Chugtai',
          email: 'dinesh@piedpiper.com',
        },
      

       async getEmployees(){
    try{
      const response = await fetch('https://jsonplaceholder.typicode.com/users')
      const data = await response.json()
      this.employees = data
    } catch (error) {
      console.error(error)
    }
  },

  async addEmployees(){
    try{
      const response = await fetch('https://jsonplaceholder.typicode.com/users', {
        method: 'POST',
        body: JSON.stringify(employee),
        headers: { 'Content-type' : 'application/json; charset=UTF-8' },
      })
      const data = await response.json()
      this.employees = [...this.employees, data]
    } catch (error) {
      console.error(error)
    }
  },

    async editEmployees(){
    try{
      const response = await fetch(`https://jsonplaceholder.typicode.com/users/${id}`, {
        method: 'PUT',
        body: JSON.stringify(updatedEmployee),
        headers: { 'Content-type' : 'application/json; charset=UTF-8' },
      })
      const data = await response.json()
      this.employees = this.employees.map(employee => (employee.id === id ? data : employee))
    } catch (error) {
      console.error(error)
    }
  },

  async deleteEmployees(){
    try{
      const response = await fetch(`https://jsonplaceholder.typicode.com/users/${id}`, {
        method: "DELETE"
      });
      this.employees = this.employees.filter(employee => employee.id !== id);
    } catch (error) {
      console.error(error);
    }
  }