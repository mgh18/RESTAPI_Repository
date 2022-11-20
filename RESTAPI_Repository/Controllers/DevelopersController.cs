using Domain;
using Microsoft.AspNetCore.Mvc;
using Services;
using System.Runtime.CompilerServices;

namespace RESTAPI_Repository.Controllers
{
    [ApiController]
    [Route("api/v1/[controller]")]
    public class DevelopersController: ControllerBase
    {
        protected readonly IDeveloperService _developerService;
        public DevelopersController(IDeveloperService developerService)
        {
            _developerService = developerService;
        }
        [Route("[action]")]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> GetAllDevelopers()
        {
            var developers = await _developerService.GetAllDevelopers();
            return Ok(developers);
        }
        [Route("[action]")]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> GetDeveloperById(int Id)
        {
            var developers = await _developerService.GetDeveloperById(Id);
            return Ok(developers);
        }

        [Route("[action]")]
        [HttpGet]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public async Task<IActionResult> GetDeveloperByEmail(String Email)
        {
            var developers = await _developerService.GetDeveloperByEmail(Email);
            return Ok(developers);
        }

        [Route("[action]")]
        [HttpPost]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult AddDeveloper([FromBody] Developer developer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
            _developerService.AddDeveloper(developer);
            return CreatedAtAction(nameof(GetDeveloperById),new {id = developer.Id},developer);

        }
        
        [HttpPut]
        [ProducesResponseType(StatusCodes.Status201Created)]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult UpdateDeveloper([FromBody] Developer developer)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest();
            }
            _developerService.UpdateDeveloper(developer);
            return CreatedAtAction(nameof(GetDeveloperById), new { id = developer.Id }, developer);

        }
        [Route("[action]")]
        [HttpDelete]
        [ProducesResponseType(StatusCodes.Status200OK)]
        public IActionResult DeleteDeveloper(int Id)
        {
            _developerService.DeleteDeveloper(Id);
            return Ok();
        }


    }
}
