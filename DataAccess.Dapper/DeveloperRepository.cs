using Dapper;
using Domain;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccess.Dapper
{
    public class DeveloperRepository:IDeveloperRepository
    {
        protected readonly IConfiguration _config;
        public DeveloperRepository(IConfiguration config)
        {
            _config = config;
        }

        public IDbConnection Connection
        {
            get
            {
                return new SqlConnection(_config.GetConnectionString("DeveloperDbConnection"));
            }
        }

        public void AddDeveloper(Developer developer)
        {
            try
            {
                using(IDbConnection dbConnection= Connection)
                {
                    dbConnection.Open();
                    String query = "INSERT INTO Developers(DeveloperName,Email,GithubURL,ImageURL,Department,JoinedDate) VALUES (@DeveloperName,@Email,@GithubURL,@ImageURL,@Department,@JoinedDate)";
                    dbConnection.Execute(query,developer);
                }

            }
            catch(Exception ex)
            {
                throw ex;
            }
        }

        public void DeleteDeveloper(int Id)
        {
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    String query = "DELETE FROM Developers WHERE Id = @Id";
                    dbConnection.Execute(query, new {Id = Id});
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<IEnumerable<Developer>> GetAllDevelopersAsync()
        {
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    String query = "SELECT Id,DeveloperName,Email,GithubURL,ImageURL,Department,JoinedDate FROM Developers";
                    return await dbConnection.QueryAsync<Developer>(query);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Developer> GetDeveloperByEmailAsync(string Email)
        {
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    String query = "SELECT * FROM Developers WHERE Email=@Email";
                    return await dbConnection.QueryFirstOrDefaultAsync<Developer>(query, new { Email = Email });
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public async Task<Developer> GetDeveloperByIdAsync(int Id)
        {
            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    String query = "SELECT * FROM Developers WHERE Id=@Id";
                    return await dbConnection.QueryFirstOrDefaultAsync<Developer>(query, new { Id = Id });
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public void UpdateDeveloper(Developer developer)
        {

            try
            {
                using (IDbConnection dbConnection = Connection)
                {
                    dbConnection.Open();
                    String query = "UPDATE Developers SET DeveloperName=@DeveloperName,Email=@Email,GithubURL=@GithubURL,ImageURL=@ImageURL,Department=@Department,JoinedDate=@JoinedDate WHERE Id=@Id";
                    dbConnection.Execute(query, developer);
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
